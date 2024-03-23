local touchedCount = 0

local Temp = nil
local SpeedLimiter = script.Parent.Parent
local Console = SpeedLimiter.Parent
local Limit = SpeedLimiter.Limit

script.Parent.Touched:Connect(function(hit)
    --12까지 1초에 닿는 미만과 초과
    if hit.Name == "Sen" then
        touchedCount = touchedCount + 1
    end
end)

while task.wait(1) do -- 1초 대기
    if touchedCount < 5 then
        print("안전속도범위" .. touchedCount)
        touchedCount = 0
    elseif touchedCount >= 5 then
        print("속도제한장치 가동" .. touchedCount)
        Limit.RopeConstraint.WinchTarget = 2 -- 속도제한장치 가동시는 2, 평상시는 8
        require(Console.VVVFModule).Stop()
        require(Console.VVVFModule).Inspection(true)
        require(Console.VVVFModule).PowerRopeBrake(true)
    end
end
