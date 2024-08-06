local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Player =game.Players.LocalPlayer
local Window = OrionLib:MakeWindow({Name = "Phantom Hub", HidePremium = false, SaveConfig = true, IntroText = " Key System"})

OrionLib:MakeNotification({
	Name = "Logged in!",
	Content = "You are logged in as "..Player.Name..".",
	Image = "rbxassetid://4483345998",
	Time = 5
})


_G.Key = "IX On Top"
_G.KeyInput = "string"

function MakeScriptHub()
    local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/VisualRoblox/Roblox/main/UI-Libraries/Visual%20Command%20UI%20Library/Source.lua', true))()

local Window = Library:CreateWindow({
    Name = 'Parrying - true                                                        Spamming - false',
    IntroText = 'Phantom Hub Blade ball, Original by fsploit',
    IntroIcon = 'rbxassetid://10618644218',
    IntroBlur = true,
    IntroBlurIntensity = 15,
    Theme = Library.Themes.dark,
    Position = 'bottom',
    Draggable = true,
    Prefix = ';'
})


-- shit plotonium

--2nd
local plrs = cloneref(game:GetService("Players"))
local lp = plrs.LocalPlayer
local rs = cloneref(game:GetService("RunService"))

local playrewardscontroller
local rewardinfo
local gotcontrollers = pcall(function()
    playrewardscontroller = require(game:GetService("ReplicatedStorage").Controllers.UI.PlaytimeRewardsController)
    rewardinfo = require(game:GetService("ReplicatedStorage").Common.PlaytimeRewardsInfo).Rewards
end)


local hitremote 
for i,v in next, game:GetDescendants() do
    if v and v.Name:find("\n") and v:IsA("RemoteEvent") then
        hitremote = v
        break
    end
end

if not hitremote then
    lp:Kick("JOIN OUR SERVER! THIS IS OUT-DATED COPIED TO YOUR CLIP BOARD")
    return
end

getnearestball = function()
    local ball
    local dist = math.huge
    local istrain = true
    local ballpath = game:GetService("Workspace"):FindFirstChild("TrainingBalls")
    if lp.Character:IsDescendantOf(game:GetService("Workspace"):FindFirstChild("Alive")) then
        istrain = false
        ballpath = game:GetService("Workspace"):FindFirstChild("Balls")
    end
    for i,v in next, ballpath:GetChildren() do
        if v and v:IsA("Part") and v:GetAttribute("realBall") and v:GetAttribute("realBall") == true then
            local mag = lp:DistanceFromCharacter(v.Position)
            if dist > mag then
                ball = v
                dist = mag
            end
        end
    end
    if ball and ball.Position then
        return ball, dist, ball.Position, istrain
    end
    return ball, dist, nil, istrain
end

getballtarget = function()
    local ball, mag, pos = getnearestball()
    if ball and ball:GetAttribute("target") then
        return ball:GetAttribute("target")
    end
end

isballtargetingplr = function()
    local ball, mag, pos = getnearestball()
    if getballtarget() == lp.Name then
        return true
    end
    return false
end

getplrs = function()
    local plrss = {}
    for i,v in next, plrs:GetPlayers() do
        if v and v.Character and v.Character:IsDescendantOf(game:GetService("Workspace"):FindFirstChild("Alive")) then
            plrss[v.Name] = v.Character.PrimaryPart.Position + Vector3.new(10, 10, 10)
        end
    end
    return plrss
end

getcloseplr = function()
    local plr
    local dista = math.huge
    for i,v in next, plrs:GetPlayers() do
        if v and v ~= lp and v.Character and v.Character:IsDescendantOf(game:GetService("Workspace"):FindFirstChild("Alive")) and v.Character:FindFirstChildOfClass("Humanoid") and v.Character:FindFirstChildOfClass("Humanoid").Health > 0 and v.Character.PrimaryPart then
            local dist = lp:DistanceFromCharacter(v.Character.PrimaryPart.Position)
            if dist < dista then
                dista = dist
                plr = v
            end
        end
    end
    return plr
end

getplrfromname = function(plr)
    return plrs:FindFirstChild(plr)
end


getmap = function()
    for i,v in next, game:GetService("Workspace"):FindFirstChild("Map"):GetChildren() do
        return v
    end
end

getfrom = function()
    for i,v in next, game:GetService("Workspace"):FindFirstChild("Balls"):GetChildren() do
        if v and v:GetAttribute("realBall") and v:GetAttribute("realBall") == true and v:GetAttribute("from") and v:GetAttribute("from") ~= lp.Name then
            return v:GetAttribute("from")
        end
    end
    return false
end

getfrom = function()
    local ball, mag, pos = getnearestball()
    if ball and ball:GetAttribute("realBall") and ball:GetAttribute("realBall") == true and ball:GetAttribute("from") and ball:GetAttribute("from") ~= lp.Name then
        return ball:GetAttribute("from")
    end
    return false
end

getplr = function(plrname)
    return game:GetService("Workspace"):FindFirstChild("Alive"):FindFirstChild(plrname)
end

getplrmag = function(plr)
    return (lp.Character.PrimaryPart.Position - plr.Position).Magnitude
end

checkplr = function(plr)
    if plr and plr.Character and plr.Character:FindFirstChildWhichIsA("Humanoid") and plr.Character:FindFirstChildWhichIsA("Humanoid").Health > 0 and plr.Character.PrimaryPart then
        if plr.Character:IsDescendantOf(game:GetService("Workspace"):FindFirstChild("Alive")) then
            return true
        end
    end
end

local cframes = {
    CFrame.new(-Random.new():NextNumber(200, 500), Random.new():NextNumber(0, 40), -Random.new():NextNumber(70, 120), -Random.new():NextNumber(0, 4), Random.new():NextNumber(0, 4), Random.new():NextNumber(0, 4), math.random(0, 4), Random.new():NextNumber(0, 4), Random.new():NextNumber(0, 4), Random.new():NextNumber(0, 4), Random.new():NextNumber(0, 4),Random.new():NextNumber(0, 4)),
    CFrame.new(-Random.new():NextNumber(200, 500), Random.new():NextNumber(0, 40), -Random.new():NextNumber(70, 120), -Random.new():NextNumber(0, 4), Random.new():NextNumber(0, 4), Random.new():NextNumber(0, 4), math.random(0, 4), Random.new():NextNumber(0, 4), -Random.new():NextNumber(0, 4), -Random.new():NextNumber(0, 4), -Random.new():NextNumber(0, 4),-Random.new():NextNumber(0, 4)),
    CFrame.new(-Random.new():NextNumber(200, 500), Random.new():NextNumber(0, 80), -Random.new():NextNumber(70, 120), -Random.new():NextNumber(0, 4), Random.new():NextNumber(0, 4), Random.new():NextNumber(0, 4), math.random(0, 4), Random.new():NextNumber(0, 4), -Random.new():NextNumber(0, 4), -Random.new():NextNumber(0, 4), -Random.new():NextNumber(0, 4),-Random.new():NextNumber(0, 4)),
    CFrame.new(-Random.new():NextNumber(200, 600), Random.new():NextNumber(0, 80), -Random.new():NextNumber(70, 120), -Random.new():NextNumber(0, 4), Random.new():NextNumber(0, 4), Random.new():NextNumber(0, 4), math.random(0, 4), Random.new():NextNumber(0, 4), Random.new():NextNumber(0, 4), Random.new():NextNumber(0, 4), Random.new():NextNumber(0, 4),Random.new():NextNumber(0, 4))
}

local canautoparry = false
local canautorapture = false
local canautospam = false
local canautocurve = false
local parrydist = 1.65
local oldparrydist = 1.65
local autospamspeed = 12
local parrycon = {}

startautoparry = function()
    spawn(function()
        local raptureremote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlrRaptured")
        local lasthit = tick()
        local reset = nil
        local spamnoti = true
        local canhit = true
        table.insert(parrycon, game:GetService("RunService").PreRender:Connect(function()
            if not canautoparry then
                for i,v in next, parrycon do
                    v:Disconnect()
                end
                table.clear(parrycon)
            end
            local ball, mag, ballpos, istraining = getnearestball()
            if ball and mag and ballpos and isballtargetingplr() then
                
                reset = true 
                local speed = ball.AssemblyLinearVelocity.Magnitude
                local speedy = ball.AssemblyLinearVelocity.Y
                local args = {
                    [1] = 0.5,
                    [2] = canautocurve and cframes[math.random(1, #cframes)] or CFrame.new(0,0,0),
                    [3] = getcloseplr() and {[tostring(getcloseplr().Name)] = getcloseplr().Character.PrimaryPart.Position} or getplrs(),
                    [4] = {
                        [1] = math.random(200, 500),
                        [2] = math.random(100, 200)
                    },
                    [5] = false
                }
                local magplr = 40
                if canautospam and canautoparry and not istraining then
                    local plrname = getfrom()
                    if plrname and getplr(plrname) and getplrmag(getplr(plrname).PrimaryPart) then 
                        magplr = getplrmag(getplr(plrname).PrimaryPart)
                    end
                    if tick() - lasthit < 0.35 or 24 >= magplr and canhit and speed >= 300 then
                        for i = 1, autospamspeed do
                            if 23.5 < mag and speed <= 210 then
                                task.wait(mag/170)
                            end
                            for i = 1,autospamspeed do
                                hitremote:FireServer(unpack(args))
                                if not magplr or getplr(plrname):FindFirstChildWhichIsA("Humanoid").Health < 0.1 or  magplr >= 26 or 270 >= speed or tick() - lasthit > 0.85 or not lp.Character:IsDescendantOf(game:GetService("Workspace"):FindFirstChild("Alive")) or not canautoparry then
                                    break
                                end
                            end        
                        end
                    end
                end
                if canautorapture then
                    if (speed / mag) >= (parrydist - 0.05) then
                        raptureremote:FireServer(unpack(args))
                    end
                end
                speed -= 15
                if lp.Character:FindFirstChildWhichIsA("Humanoid") and lp.Character:FindFirstChildWhichIsA("Humanoid").MoveDirection ~= Vector3.zero then
                    speed -= 2.75
                end
                if (speed / mag) >= (parrydist) and speed > 50 or 25 > mag then
                    if canautoparry and canhit and speed > 0 then
                        if speedy > 30 and speed >= 280 then
                            task.wait(speedy/(speed/0.5))
                        end
                        canhit = false
                        hitremote:FireServer(unpack(args))
                        task.delay(2, function()
                            canhit = true
                        end)
                    end
                end
            else
                if reset then
                    canhit = true
                    if not isballtargetingplr() or not ball then
                        lasthit = tick()
                    end
                    reset = nil
                end
            end
        end))
    end)
end
                        
local Stats = game:GetService("Stats");
local Players = game:GetService("Players");
local RunService = game:GetService("RunService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local TweenService = game:GetService("TweenService");
local Nurysium_Util = loadstring(game:HttpGet("https://raw.githubusercontent.com/flezzpe/Nurysium/main/nurysium_helper.lua"))();
local local_player = Players.LocalPlayer;
local camera = workspace.CurrentCamera;
local nurysium_Data = nil;
local hit_Sound = nil;
local closest_Entity = nil;
local parry_remote = nil;
getgenv().aura_Enabled = false;
getgenv().hit_sound_Enabled = false;
getgenv().hit_effect_Enabled = false;
getgenv().night_mode_Enabled = false;
getgenv().trail_Enabled = false;
getgenv().self_effect_Enabled = false;
getgenv().kill_effect_Enabled = false;
getgenv().shaders_effect_Enabled = false;
getgenv().ai_Enabled = false;
getgenv().spectate_Enabled = false;
local Services = {game:GetService("AdService"),game:GetService("SocialService")};
function SwordCrateManual()
	game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("PromptPurchaseCrate", workspace.Spawn.Crates.NormalSwordCrate);
end
function ExplosionCrateManual()
	game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("PromptPurchaseCrate", workspace.Spawn.Crates.NormalExplosionCrate);
end
function SwordCrateAuto()
	while _G.AutoSword do
		game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("PromptPurchaseCrate", workspace.Spawn.Crates.NormalSwordCrate);
		wait(1);
	end
end
function ExplosionCrateAuto()
	while _G.AutoBoom do
		game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("PromptPurchaseCrate", workspace.Spawn.Crates.NormalExplosionCrate);
		wait(1);
	end
end
        
function initializate(dataFolder_name)
	local nurysium_Data = Instance.new("Folder", game:GetService("CoreGui"));
	nurysium_Data.Name = dataFolder_name;
	hit_Sound = Instance.new("Sound", nurysium_Data);
	hit_Sound.SoundId = "rbxassetid://8632670510";
	hit_Sound.Volume = 0.5;
end
local function get_closest_entity(Object)
	task.spawn(function()
		local closest;
		local max_distance = math.huge;
		for index, entity in workspace.Alive:GetChildren() do
			if (entity.Name ~= Players.LocalPlayer.Name) then
				local distance = (Object.Position - entity.HumanoidRootPart.Position).Magnitude;
				if (distance < max_distance) then
					closest_Entity = entity;
					max_distance = distance;
				end
			end
		end
		return closest_Entity;
	end);
end
function resolve_parry_Remote()
	for _, value in Services do
		local temp_remote = value:FindFirstChildOfClass("RemoteEvent");
		if not temp_remote then
			continue;
		end
		if not temp_remote.Name:find("\n") then
			continue;
		end
		parry_remote = temp_remote;
	end
end
local aura_table = {canParry=true,is_Spamming=false,parry_Range=0,spam_Range=0,hit_Count=0,hit_Time=tick(),ball_Warping=tick(),is_ball_Warping=false};
ReplicatedStorage.Remotes.ParrySuccess.OnClientEvent:Connect(function()
	if getgenv().hit_sound_Enabled then
		hit_Sound:Play();
	end
	if getgenv().hit_effect_Enabled then
		local hit_effect = game:GetObjects("rbxassetid://17407244385")[1];
		hit_effect.Parent = Nurysium_Util.getBall();
		hit_effect:Emit(3);
		task.delay(5, function()
			hit_effect:Destroy();
		end);
	end
end);
ReplicatedStorage.Remotes.ParrySuccessAll.OnClientEvent:Connect(function()
	aura_table.hit_Count += 1
	task.delay(0.15, function()
		aura_table.hit_Count -= 1
	end);
end);
workspace:WaitForChild("Balls").ChildRemoved:Connect(function(child)
	aura_table.hit_Count = 0;
	aura_table.is_ball_Warping = false;
	aura_table.is_Spamming = false;
end);

task.defer(function()
	game:GetService("RunService").Heartbeat:Connect(function()
		if not local_player.Character then
			return;
		end
		if getgenv().trail_Enabled then
			local trail = game:GetObjects("rbxassetid://17483658369")[1];
			trail.Name = "nurysium_fx";
			if local_player.Character.PrimaryPart:FindFirstChild("nurysium_fx") then
				return;
			end
			local Attachment0 = Instance.new("Attachment", local_player.Character.PrimaryPart);
			local Attachment1 = Instance.new("Attachment", local_player.Character.PrimaryPart);
			Attachment0.Position = Vector3.new(0, -2.411, 0);
			Attachment1.Position = Vector3.new(0, 2.504, 0);
			trail.Parent = local_player.Character.PrimaryPart;
			trail.Attachment0 = Attachment0;
			trail.Attachment1 = Attachment1;
		elseif local_player.Character.PrimaryPart:FindFirstChild("nurysium_fx") then
			local_player.Character.PrimaryPart['nurysium_fx']:Destroy();
		end
	end);
end);
task.defer(function()
	RunService.RenderStepped:Connect(function()
		if getgenv().spectate_Enabled then
			local self = Nurysium_Util.getBall();
			if not self then
				return;
			end
			workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(CFrame.new(workspace.CurrentCamera.CFrame.Position, self.Position), 1.5);
		end
	end);
end);
task.defer(function()
	while task.wait(1) do
		if getgenv().night_mode_Enabled then
			game:GetService("TweenService"):Create(game:GetService("Lighting"), TweenInfo.new(3), {ClockTime=3.9}):Play();
		else
			game:GetService("TweenService"):Create(game:GetService("Lighting"), TweenInfo.new(3), {ClockTime=13.5}):Play();
		end
	end
end);
task.spawn(function()
	RunService.PreRender:Connect(function()
		if not getgenv().aura_Enabled then
			return;
		end
		if closest_Entity then
			if (workspace.Alive:FindFirstChild(closest_Entity.Name) and (workspace.Alive:FindFirstChild(closest_Entity.Name).Humanoid.Health > 0)) then
				if aura_table.is_Spamming then
					if (local_player:DistanceFromCharacter(closest_Entity.HumanoidRootPart.Position) <= aura_table.spam_Range) then
						parry_remote:FireServer(0.5, CFrame.new(camera.CFrame.Position, camera.CFrame.Position + (camera.CFrame.LookVector * 100)), {[closest_Entity.Name]=closest_Entity.HumanoidRootPart.Position}, {closest_Entity.HumanoidRootPart.Position.X,closest_Entity.HumanoidRootPart.Position.Y}, false);
					end
				end
			end
		end
	end);
	RunService.PreRender:Connect(function()
		if not getgenv().aura_Enabled then
			return;
		end
		local ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue() / 10;
		local self = Nurysium_Util.getBall();
		if not self then
			return;
		end
		self:GetAttributeChangedSignal("target"):Once(function()
			aura_table.canParry = true;
		end);
		if ((self:GetAttribute("target") ~= local_player.Name) or not aura_table.canParry) then
			return;
		end
		get_closest_entity(local_player.Character.PrimaryPart);
		local player_Position = local_player.Character.PrimaryPart.Position;
		local ball_Position = self.Position;
		local ball_Velocity = self.AssemblyLinearVelocity;
		if self:FindFirstChild("zoomies") then
			ball_Velocity = self.zoomies.VectorVelocity;
		end
		local ball_Direction = (local_player.Character.PrimaryPart.Position - ball_Position).Unit;
		local ball_Distance = local_player:DistanceFromCharacter(ball_Position);
		local ball_Dot = ball_Direction:Dot(ball_Velocity.Unit);
		local ball_Speed = ball_Velocity.Magnitude;
		local ball_speed_Limited = math.min(ball_Speed / 1000, 0.1);
		local ball_predicted_Distance = (ball_Distance - (ping / 15.5)) - (ball_Speed / 3.5);
		local target_Position = closest_Entity.HumanoidRootPart.Position;
		local target_Distance = local_player:DistanceFromCharacter(target_Position);
		local target_distance_Limited = math.min(target_Distance / 10000, 0.1);
		local target_Direction = (local_player.Character.PrimaryPart.Position - closest_Entity.HumanoidRootPart.Position).Unit;
		local target_Velocity = closest_Entity.HumanoidRootPart.AssemblyLinearVelocity;
		local target_isMoving = target_Velocity.Magnitude > 0;
		local target_Dot = target_isMoving and math.max(target_Direction:Dot(target_Velocity.Unit), 0);
		aura_table.spam_Range = math.max(ping / 10, 15) + (ball_Speed / 10);
		aura_table.parry_Range = math.max(math.max(ping, 3.5) + (ball_Speed / 3.5), 9.5);
		aura_table.is_Spamming = (aura_table.hit_Count > 1) or (ball_Distance < 13.5);
		if (ball_Dot < -0.15) then
			aura_table.ball_Warping = tick();
		end
		task.spawn(function()
			if (((tick() - aura_table.ball_Warping) >= ((0.15 + target_distance_Limited) - ball_speed_Limited)) or (ball_Distance <= 12)) then
				aura_table.is_ball_Warping = false;
				return;
			end
			aura_table.is_ball_Warping = true;
		end);
		if ((ball_Distance <= aura_table.parry_Range) and not aura_table.is_Spamming and not aura_table.is_ball_Warping) then
			parry_remote:FireServer(0.5, CFrame.new(camera.CFrame.Position, camera.CFrame.Position + (camera.CFrame.LookVector * 100)), {[closest_Entity.Name]=closest_Entity.HumanoidRootPart.Position}, {closest_Entity.HumanoidRootPart.Position.X,closest_Entity.HumanoidRootPart.Position.Y}, false);
			aura_table.canParry = false;
			aura_table.hit_Time = tick();
			aura_table.hit_Count += 1
			task.delay(0.15, function()
				aura_table.hit_Count -= 1
			end);
		end
		task.spawn(function()
			repeat
				RunService.PreRender:Wait();
			until (tick() - aura_table.hit_Time) >= 1 
			aura_table.canParry = true;
		end);
	end);
end);
initializate("nurysium_temp");

-- loader

local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

local Window = redzlib:MakeWindow({
  Title = "Phantom Hub - Blade Ball",
  SubTitle = "by @kinggowtham_ and @dwimback69.",
  SaveFolder = "Gyatttt"
})
local Tab1 = Window:MakeTab({"Information", "newspaper"})
local Tab2 = Window:MakeTab({"Combat", "swords"})
local Tab3 = Window:MakeTab({"miscellaneous", "search"})
local Tab4 = Window:MakeTab({"Crates", "box"})
local Tab5 = Window:MakeTab({"Animation", "play"})
local Tab6 = Window:MakeTab({"Credits", "copyright"})

    
-- info
    
local Section = Tab1:AddSection({"Information"})
local Paragraph = Tab1:AddParagraph({"Phantom", "(fixed parry fixed spam and fixed more)"})
local Paragraph = Tab1:AddParagraph({"Added", "Nothing has been added."})
local Paragraph = Tab1:AddParagraph({"Deleted", "Nothing has been deleted"})


-- combat

local Section = Tab2:AddSection({"Automation"})

local Toggle = Tab2:AddToggle({"Auto Parry", true, function(call)
        canautoparry = call
        if canautoparry then
            startautoparry()
        else
            for i,v in next, parrycon do
                v:Disconnect()
            end
            table.clear(parrycon)
        end 
end})

local Toggle = Tab2:AddToggle({"Auto Spam", true, function(call)
  canautospam = call
end})

local Toggle = Tab2:AddToggle({"Auto Curve", true, function(call)
    canautocurve = call
end})

local Button = Tab2:AddButton({"Manual Spam (mobile)", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/nqxlOfc/SlzAX17vGCub7iRKVmJid61Bg/main/KwKVzV5SgcFBd9fnpLr4lKCg6.lua"))()
end})

local Button = Tab2:AddButton({"Manual Spam (Pc)", function()
local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
    local Notify = AkaliNotif.Notify;
                      Notify({
                      Description = "Keybind Is E.";
                      Title = "Phantom";
                      Duration = 9.5;
                      });
    local activatedD = false
          local function toggle()
            activatedD = not activatedD
            while activatedD do
              local args = {
                [1] = 1.5,
                [2] = CFrame.new(-254.2939910888672, 112.13581848144531, -119.27256774902344) * CFrame.Angles(-2.029526710510254, 0.5662040710449219, 2.314905881881714),
                [3] = {
                  ["2617721424"] = Vector3.new(-273.400146484375, -724.8031005859375, -20.92414093017578),
                },
                [4] = {
                  [1] = 910,
                  [2] = 154
                }
              }
              game:GetService("ReplicatedStorage").Remotes.ParryAttempt:FireServer(unpack(args))
              game:GetService("RunService").Heartbeat:Wait()
            end
          end
          
          local UserInputService = game:GetService("UserInputService")
          local eKeyPressed = false
          UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
            if input.KeyCode == Enum.KeyCode.E and not gameProcessedEvent then
              eKeyPressed = true
              toggle()
            end
          end)
          UserInputService.InputEnded:Connect(function(input, gameProcessedEvent)
            if input.KeyCode == Enum.KeyCode.E then
              eKeyPressed = false
                         
            end
          end)
end})


-- edits
local Section = Tab2:AddSection({"Ranges"})

Tab2:AddSlider({
  Name = "Auto Parry Range",
  Min = 1,
  Max = 10,
  Increase = 1.65,
  Default = 1.65,
  Callback = function(call)
    parrydist = tonumber(call)
        oldparrydist = tonumber(call)
  end
})

Tab2:AddSlider({
  Name = "Auto Spam Range",
  Min = 1,
  Max = 30,
  Increase = 12,
  Default = 12,
  Callback = function(call)
    autospamspeed = tonumber(call)
  end
})

local Section = Tab2:AddSection({"Ball"})

local Toggle = Tab2:AddToggle({"View Part", false, function(toggled)
            if toggled then 
            local globals = {}
            local TweenService = game:GetService("TweenService")

            local function get_plr()
                return game.Players.LocalPlayer
            end

            local initialSize = Vector3.new(10, 10, 10)
            local targetSize = Vector3.new(45, 45, 45)  
            local resizeTime = 0.1

            local function ViewParryArea()
                local previousVisual = workspace:FindFirstChild("Parry Range")
                if previousVisual then
                    previousVisual:Destroy()
                end

                local Visual = Instance.new("Part", workspace)
                Visual.Name = "Parry Range"
                Visual.Material = Enum.Material.ForceField
                Visual.CastShadow = false
                Visual.CanCollide = false
                Visual.Anchored = true
                Visual.BrickColor = BrickColor.new("Bright blue")
                Visual.Shape = Enum.PartType.Ball
                Visual.Size = initialSize

                local Players = game:GetService("Players")
                local Player = Players.LocalPlayer

                globals.ViewParryArea = true

                while globals.ViewParryArea do
                    task.wait()
                    
                    local plrChar = Player.Character or Player.CharacterAdded:Wait()
                    local plrPP = plrChar:FindFirstChild("HumanoidRootPart") or plrChar.PrimaryPart

                    if plrPP then
                        Visual.CFrame = CFrame.new(plrPP.Position)
                        local targetSize = plrChar:FindFirstChild("Highlight") and targetSize or initialSize

                        local tweenInfo = TweenInfo.new(resizeTime, Enum.EasingStyle.Linear)
                        local tween = TweenService:Create(Visual, tweenInfo, {Size = targetSize})
                        tween:Play()
                        
                        Visual.Position = plrPP.Position
                    else
                        Visual.Position = Vector3.new(1000, 1000, 1000)
                    end
                end
            end

            ViewParryArea()

        else
            local previousVisual = workspace:FindFirstChild("Parry Range")
            if previousVisual then
                previousVisual:Destroy()
            end
        end

end})

local Toggle = Tab2:AddToggle({"Look at ball", false, function(Value)
  getgenv().spectate_Enabled = toggled;
end})

-- misc

local Section = Tab3:AddSection({"Effects"})

local Paragraph = Tab3:AddParagraph({"Nurysium.", "Thanks for Nurysium Giving me his Code! Credits on Nurysium to make this happen!"})

local Toggle = Tab3:AddToggle({"Hit Sound", false, function(toggled)
    getgenv().hit_sound_Enabled = toggled
end})

local Toggle = Tab3:AddToggle({"Hit Effect", false, function(toggled)
    getgenv().hit_effect_Enabled = toggled
end})

local Toggle = Tab3:AddToggle({"Self Effect", false, function(toggled)
    getgenv().self_effect_Enabled = toggled
end})

local Toggle = Tab3:AddToggle({"Trail", false, function(toggled)
    getgenv().trail_Enabled = toggled
end})

local Section = Tab3:AddSection({"Misc"})


local Toggle = Tab3:AddToggle({"Anti Afk", false, function(call)
 
end})

local Toggle = Tab3:AddToggle({"Esp", false, function(call)
    loadstring(game:HttpGet("https://pastebin.com/raw/SjyEEE92"))();
end})

local Toggle = Tab3:AddToggle({"toggle Day/Night", false, function(toggled)
    getgenv().night_mode_Enabled = toggled
end})

-- crates

local Section = Tab4:AddSection({"Manual"})

local Button = Tab4:AddButton({"Open Sword Crate", function()
    SwordCrateManual()
end})

local Button = Tab4:AddButton({"Open Explosion Crate", function()
    ExplosionCrateManual()
end})

local Section = Tab4:AddSection({"Automatic"})

local Toggle = Tab4:AddToggle({"Auto Open Sword Crate", false, function(Value)
 _G.AutoSword = Value
        SwordCrateAuto()
end})

local Toggle = Tab4:AddToggle({"Auto Open Explosion Crate", false, function(Value)
 _G.AutoBoom = Value
        ExplosionCrateAuto()
end})

local Section = Tab5:AddSection({"Anims"})

local Paragraph = Tab5:AddParagraph({"Animations", "these will come soon since blade ball blocks fe r6 scripts"})


local Section = Tab6:AddSection({"Credits"})

local Paragraph = Tab6:AddParagraph({"Fsploit", "Developer of this hub"})

local Paragraph = Tab6:AddParagraph({"Huge thanks to", "Nurysium, DendenZ, Fsploit, Venox Team, And us"})

    print("EnteredCorrectKey")
  end
  
  function CorrectKeyNotifcation()
    OrionLib:MakeNotification({
	Name = "Correct Key",
	Content = "You Have Entered The Correct Key!",
	Image = "rbxassetid://4483345998",
	Time = 5
})
end 

  function IncorrectKeyNotifcation()
    OrionLib:MakeNotification({
	Name = "Incorrect Key",
	Content = "You Have Entered The Incorrect Key!",
	Image = "rbxassetid://4483345998",
	Time = 5
})
end 


local Tab = Window:MakeTab({
	Name = "Key Tab",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddTextbox({
	Name = "Enter Key",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
      _G.KeyInput = Value
	end	  
})

Tab:AddButton({
	Name = "Check Key",
	Callback = function()
      		if _G.KeyInput = _G.Key then
            MakeScriptHub()
            CorrectKeyNotification()
          else
            IncorrectKeyNotification()
          end
  	end    
})
OrionLib:Init()
OrionLib:Destroy()