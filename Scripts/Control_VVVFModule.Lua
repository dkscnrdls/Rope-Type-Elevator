local VVVFModule = {}

local Console = script.Parent
local Elevator = Console.Parent
local Inspection = script.Parent.Inspection
local MainPulleyMotor = Elevator.Motor1
local DeflectiveMotor = Elevator.Motor2
local RopeBrake = Console["로프브레이크"]
local StopRopes = Console.StopRope

function VVVFModule.Increase()
    if script.Parent.Power.Value == true then
        for _, Rope in ipairs(StopRopes:GetChildren()) do
            Rope.WinchTarget = 8
        end
        MainPulleyMotor.HingeConstraint.AngularVelocity = -10
        DeflectiveMotor.HingeConstraint.AngularVelocity = -10
    else
        
    end
end

function VVVFModule.Descent()
    if script.Parent.Power.Value == true then
        for _, Rope in ipairs(StopRopes:GetChildren()) do
            Rope.WinchTarget = 8
        end
        MainPulleyMotor.HingeConstraint.AngularVelocity = 10
        DeflectiveMotor.HingeConstraint.AngularVelocity = 10
    else

    end
end

function VVVFModule.Stop()
    if script.Parent.Power.Value == true then
        if MainPulleyMotor.HingeConstraint.AngularVelocity < -0 then
            for i = MainPulleyMotor.HingeConstraint.AngularVelocity, -0 do
                if i < 0 then
                    MainPulleyMotor.HingeConstraint.AngularVelocity = MainPulleyMotor.HingeConstraint.AngularVelocity + 1
                    DeflectiveMotor.HingeConstraint.AngularVelocity = DeflectiveMotor.HingeConstraint.AngularVelocity + 1
                    for _, Rope in ipairs(StopRopes:GetChildren()) do
                        Rope.WinchTarget = 1
                    end
                    task.wait()
                    print(MainPulleyMotor.HingeConstraint.AngularVelocity)
                elseif i == 0 then

                end
            end
        elseif MainPulleyMotor.HingeConstraint.AngularVelocity > 0.5 then
            for i = -0, MainPulleyMotor.HingeConstraint.AngularVelocity do
                if i > 0 then
                    MainPulleyMotor.HingeConstraint.AngularVelocity = MainPulleyMotor.HingeConstraint.AngularVelocity - 1
                    DeflectiveMotor.HingeConstraint.AngularVelocity = DeflectiveMotor.HingeConstraint.AngularVelocity - 1
                    for _, Rope in ipairs(StopRopes:GetChildren()) do
                        Rope.WinchTarget = 1
                    end
                    task.wait()
                    print(MainPulleyMotor.HingeConstraint.AngularVelocity)
                elseif i == 0 then
                    
                end
            end
        end
    else

    end
end

function VVVFModule.Inspection(On)
    if script.Parent.Power.Value == true then
        if On == true then
            Inspection.Value = true
        else
            Inspection.Value = false
        end
    else

    end
end

function VVVFModule.PowerRopeBrake(Bool)
    if Bool == true then
        for _, Rod in ipairs(RopeBrake["브레이크"]:GetChildren()) do
            if Rod:IsA("RodConstraint") then
                Rod.Length = 0.1
            end
        end
    elseif Bool == false then
        for _, Rod in ipairs(RopeBrake["브레이크"]:GetChildren()) do
            if Rod:IsA("RodConstraint") then
                Rod.Length = Rod:FindFirstChild("Default").Value
            end
       end
    end
end

return VVVFModule
