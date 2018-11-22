local get = {}
get.songs = {
    paeon = {[1]='Army\'s Paeon VI',[2]='Army\'s Paeon V',[3]='Army\'s Paeon IV',[4]='Army\'s Paeon III',[5]='Army\'s Paeon II',[6]='Army\'s Paeon'},
    ballad = {[1]='Mage\'s Ballad III',[2]='Mage\'s Ballad II',[3]='Mage\'s Ballad'},
    minne = {[1]='Knight\'s Minne V',[2]='Knight\'s Minne IV',[3]='Knight\'s Minne III',[4]='Knight\'s Minne II',[5]='Knight\'s Minne'},
    march = {[1]='Victory March',[2]='Advancing March'},
    minuet = {[1]='Valor Minuet V',[2]='Valor Minuet IV',[3]='Valor Minuet III',[4]='Valor Minuet II',[5]='Valor Minuet'}, 
    madrigal = {[1]='Blade Madrigal',[2]='Sword Madrigal'},
    prelude = {[1]='Archer\'s Prelude',[2]='Hunter\'s Prelude'},
    mambo = {[1]='Dragonfoe Mambo',[2]='Sheepfoe Mambo'},
    aubade = {[1]='Fowl Aubade'},
    pastoral = {[1]='Herb Pastoral'},
    fantasia = {[1]='Shining Fantasia'},
    operetta = {[1]='Puppet\'s Operetta',[2]='Scop\'s Operetta'},
    capriccio = {[1]='Gold Capriccio'},
    round = {[1]='Warding Round'},
    gavotte = {[1]='Shining Fantasia'},
    hymnus = {[1]='Goddess\'s Hymnus'},
    mazurka = {[1]='Chocobo Mazurka'},
    sirvente = {[1]='Foe Sirvente'},
    dirge = {[1]='Adventurer\'s Dirge'},
    scherzo = {[1]='Sentinel\'s Scherzo'},
    }

function get.item(...)
    local item_ids = L{...}
    local items = windower.ffxi.get_items()
    for i,v in ipairs(items.inventory) do
        if item_ids:contains(v.id) then
            return true
        end
    end
    for i,v in ipairs(items.wardrobe) do
        if item_ids:contains(v.id) then
            return true
        end
    end
    return false
end

function get.extra_song()
    if get.item(18571,18839) then
        return 4
    elseif get.item(21407,18575,18576,21400,21401) then
        return 3
    end
    return  2
end
base_songs = get.extra_song()

function get.buffs(curbuffs)
    local buffs = {}
    for i,v in pairs(curbuffs) do
        if res.buffs[v] and res.buffs[v].english then
            buffs[res.buffs[v].english:lower()] = (buffs[res.buffs[v].english:lower()] or 0) + 1
        end
    end
    return buffs
end

function get.equip(slot)
    local item = windower.ffxi.get_items().equipment
    return ids.equipment[windower.ffxi.get_items(item[slot..'_bag'],item[slot]).id] or ''
end

function get.spell(spell)
    for k,v in pairs(ids.spells) do
        if v and v.enl and string.lower(v.enl) == string.lower(spell) then
            return v
        end
    end
    return nil
end

function get.song(song)
    for k,v in pairs(ids.songs) do 
        if k ~= n and string.lower(v) == string.lower(song) then
            return {id=k,enl=v}
        end
    end
    return nil
end

function get.maxsongs(targ,buffs)
    local maxsongs = get.extra_song()
    if buffs['clarion call'] then
        maxsongs = maxsongs + 1 
    end
    if timers[targ] and maxsongs < table.length(timers[targ]) then--
        maxsongs = table.length(timers[targ])
    end
    return maxsongs
end

function get.song_list(songs,targ,maxsongs)
    local list = {}
    local clarion = settings.clarion[targ:lower()]
    for k,v in pairs(songs) do
        list[k] = v
    end
    if clarion and maxsongs > base_songs then
        list[clarion] = (list[clarion] or 0) + 1 
    end
    return list
end

function get.coords()
    local play = windower.ffxi.get_mob_by_target('me')
    if play then
        return {play.x,play.z,play.y}
    else
        return {0,0,0}
    end 
end

function get.moving()
    local coords = get.coords()
    local clock = os.clock()
    lastcoords = lastcoords and lastcoords or coords
    for x=1,3 do if lastcoords[x] ~= coords[x] then lastcoords=coords ts=clock return true end end
    if ts and ts+1>clock then return true end
    return false
end

function get.eye_sight(player,target)
    if not target then return false end
    local xdif = target.x - player.x -- Negative if target is west
    local ydif = target.y - player.y -- Negative if target is south
    if math.abs(-math.atan2(ydif,xdif)-player.facing) < 0.76 then
        return true
    else
        return false
    end
end

function get.valid_target(targ,dst)
    windower.ffxi.get_mob_by_name(targ)
    for ind,member in pairs(windower.ffxi.get_party()) do
        if type(member) == 'table' and member.mob and 
        member.mob.in_party and member.mob.hpp > 0 and 
        member.mob.name:lower() == targ:lower() and 
        math.sqrt(member.mob.distance) < dst and 
        not member.mob.charmed then
           return true
        end
    end
    return false
end

function get.aoe_range()
    for ind,member in pairs(windower.ffxi.get_party()) do
        if type(member) == 'table' and member.mob and member.mob.in_party and member.mob.hpp > 0 and
        not settings.song[member.mob.name:lower()] and not settings.ignore:find(member.mob.name:lower()) and
        math.sqrt(member.mob.distance) >= 10 and not member.mob.charmed then
           return false
        end
    end
    return true
end

return get
