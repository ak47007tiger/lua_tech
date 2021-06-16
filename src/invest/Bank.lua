local function analyzeBonus(price, bonus10)
    local investMoney = 10000.0
    investMoney = investMoney - investMoney * (2.5 / 10000)
    local amount = investMoney / price
    local bonus = amount / 10.0 * bonus10
    local rateOfReturn = bonus / investMoney
    return {
        bonus = bonus,
        rateOfReturn = rateOfReturn,
    }
end

local function printTable(title, table)
    print(title)

    for k, v in pairs(table) do
        print(k, v)
    end
end

local function investReturn(price, bonus10, futurePrice)
    local bonusResult = analyzeBonus(price, bonus10)
    local priceReturn = (futurePrice - price) * (10000.0 / price)
    return bonusResult.bonus + priceReturn
end

local minSheng = analyzeBonus(4.68, 2.13)
local jiaoTong = analyzeBonus(4.89, 3.17)

--[[
根据
分红指标
未来波动风险
计算未来x年的收益率

进而选择银行股票
]]
printTable("minSheng", minSheng)
printTable("jiaoTong", jiaoTong)
print(jiaoTong.bonus - minSheng.bonus)
print((jiaoTong.bonus - minSheng.bonus) / minSheng.bonus)

print("---------------------------")
print(investReturn(4.68, 2.3, 5))
print(investReturn(4.89, 3.17, 5))
