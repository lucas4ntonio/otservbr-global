local coins = {
    [2148] = {
     to = 2152
    },
    [2152] = {
     from = 2148, to = 2160
    },
    [2160] = {
     from = 2152
    }
}
    
function onUse(cid, item, fromPosition, itemEx, toPosition)
    local coin = coins[item.itemid]

    if item.type == 100 then
        if(coin.to ~= nil) then
            doPlayerAddItem(cid,coin.to,1)
            doRemoveItem(item.uid,item.type)
        end
    elseif item.type > 0 then
        if(coin.from ~= nil) then
            doPlayerAddItem(cid,coin.from,100)
            doRemoveItem(item.uid,1)
        end
    end

    return true
end