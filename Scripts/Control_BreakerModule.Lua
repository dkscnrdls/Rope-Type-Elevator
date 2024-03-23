local BreakerModule = {}

local Console = script.Parent
local Power = Console.Power

function BreakerModule.On()
    Power.Value = true
end

function BreakerModule.Off()
    Power.Value = false
end

return BreakerModule
