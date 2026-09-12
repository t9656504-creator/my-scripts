local P=game:GetService("Players")local R=game:GetService("RunService")local L=game:GetService("Lighting")local S=game:GetService("StarterGui")local T=game:GetService("TeleportService")local RS=game:GetService("ReplicatedStorage")local RF=game:GetService("ReplicatedFirst")local UIS=game:GetService("UserInputService")local LP=P.LocalPlayer local Cam=workspace.CurrentCamera local Mouse=LP:GetMouse()if not LP.Character then LP.CharacterAdded:Wait()end
pcall(function()LP.Kick=function()return nil end T.Teleport=function()return nil end end)
pcall(function()for _,o in pairs(workspace:GetDescendants())do if o:IsA("ParticleEmitter")or o:IsA("Trail")or o:IsA("Smoke")or o:IsA("Fire")or o:IsA("Sparkles")then o.Enabled=false end end end)
workspace.FallenPartsDestroyHeight=0/0 R.Heartbeat:Connect(function()local c=LP.Character local h=c and c:FindFirstChild("HumanoidRootPart")if h and h.Position.Y<-500 then local sp=workspace:FindFirstChild("SpawnLocation")or workspace:FindFirstChild("Spawn")h.CFrame=(sp and sp.CFrame+Vector3.new(0,5,0))or CFrame.new(0,50,0)end end)
if _G.F then _G.F:Disconnect()end _G.F=Cam:GetPropertyChangedSignal("FieldOfView"):Connect(function()if Cam.FieldOfView~=120 then Cam.FieldOfView=120 end end)Cam.FieldOfView=120
for _,c in pairs(L:GetChildren())do if c:IsA("Sky")then c:Destroy()end end local sk=Instance.new("Sky")sk.Parent=L sk.SkyboxBk="rbxassetid://600830446"sk.SkyboxDn="rbxassetid://600831635"sk.SkyboxFt="rbxassetid://600832720"sk.SkyboxLf="rbxassetid://600886090"sk.SkyboxRt="rbxassetid://600833862"sk.SkyboxUp="rbxassetid://600835177"sk.StarCount=0 sk.SunAngularSize=18 L.TimeOfDay="17:30:00"L.ClockTime=17.5 L.Brightness=1.2 L.FogEnd=100000
pcall(function()S:SetCore("MouseIcon","")Mouse.Icon=""end)
local pg=LP:WaitForChild("PlayerGui")for _,o in pairs(pg:GetDescendants())do if o:IsA("Frame")or o:IsA("ImageLabel")or o:IsA("ImageButton")or o:IsA("ScreenGui")then local n=o.Name:lower()if n:find("crosshair")or n:find("reticle")or n:find("aim")or n:find("sight")or n:find("scope")or n:find("target")or n:find("cursor")or n:find("dot")or n:find("center")then pcall(function()o.Visible=false o.Active=false o.Enabled=false if o:IsA("ScreenGui")then o:Destroy()end end)end end end
local g=Instance.new("ScreenGui")g.Name="Aim"g.ResetOnSpawn=false g.Parent=pg
local f=Instance.new("Frame")f.Size=UDim2.new(0,60,0,60)f.Position=UDim2.new(0.5,-30,0.5,-60)f.BackgroundTransparency=1 f.Parent=g
local gl=Instance.new("Frame")gl.Size=UDim2.new(0.2,0,0.2,0)gl.Position=UDim2.new(0.4,0,0.4,0)gl.BackgroundColor3=Color3.new(1,1,1)gl.BackgroundTransparency=0.6 gl.BorderSizePixel=0 local cg=Instance.new("UICorner")cg.CornerRadius=UDim.new(1,0)cg.Parent=gl gl.Parent=f
local d=Instance.new("Frame")d.Size=UDim2.new(0.06,0,0.06,0)d.Position=UDim2.new(0.47,0,0.47,0)d.BackgroundColor3=Color3.new(1,1,1)d.BackgroundTransparency=0.1 d.BorderSizePixel=0 local cd=Instance.new("UICorner")cd.CornerRadius=UDim.new(1,0)cd.Parent=d d.Parent=f
local phase=0 R.Heartbeat:Connect(function()phase=phase+1.5*R.Heartbeat:Wait()local s=0.06+0.012*math.sin(phase)d.Size=UDim2.new(s,0,s,0)d.Position=UDim2.new(0.5-s/2,0,0.5-s/2,0)end)
local targeting=false R.RenderStepped:Connect(function()if not f or not f.Parent then return end local vp=Cam.ViewportSize local ct=Vector2.new(vp.X/2,vp.Y/2-30)local ray=Cam:ScreenPointToRay(ct.X,ct.Y)local params=RaycastParams.new()if LP.Character then params.FilterDescendantsInstances={LP.Character}end params.FilterType=Enum.RaycastFilterType.Blacklist params.IgnoreWater=true local res=workspace:Raycast(ray.Origin,ray.Direction*30,params)local hit=false if res then local ch=res.Instance:FindFirstAncestorOfClass("Model")if ch then local hum=ch:FindFirstChildOfClass("Humanoid")if hum and hum.Health>0 then local pl=P:GetPlayerFromCharacter(ch)if pl and pl~=LP then hit=true end end end end if hit~=targeting then targeting=hit local col=hit and Color3.new(1,0,0)or Color3.new(1,1,1)gl.BackgroundColor3=col gl.BackgroundTransparency=hit and 0.4 or 0.6 d.BackgroundColor3=col d.BackgroundTransparency=hit and 0 or 0.1 end end)
local ce=RS:FindFirstChild("GameCorrectionEvents")if ce then local ev=ce:FindFirstChild("GameCorrectionsNotify")if ev then ev.OnClientEvent:Connect(function(m)if m=="Flying"then local ch=LP.Character local hum=ch and ch:FindFirstChildOfClass("Humanoid")if hum then ch:BreakJoints()hum.Health=0 end end end)end end
local fgui=Instance.new("ScreenGui")fgui.Name="FPSmini"fgui.ResetOnSpawn=false fgui.Parent=pg
local ffr=Instance.new("Frame")ffr.Size=UDim2.new(0,60,0,30)ffr.Position=UDim2.new(0.5,-30,0.02,0)ffr.BackgroundTransparency=1 ffr.Parent=fgui
local lbl=Instance.new("TextLabel")lbl.Size=UDim2.new(1,0,1,0)lbl.BackgroundTransparency=1 lbl.Text="0"lbl.TextColor3=Color3.new(1,1,1)lbl.TextScaled=true lbl.Font=Enum.Font.GothamBold lbl.TextXAlignment=Enum.TextXAlignment.Center lbl.TextYAlignment=Enum.TextYAlignment.Center lbl.Parent=ffr
local lt=tick()local fc=0 local fps=0 R.RenderStepped:Connect(function()fc=fc+1 local ct=tick()if ct-lt>=0.5 then fps=math.floor(fc/(ct-lt))fc=0 lt=ct lbl.Text=tostring(fps)if fps>=60 then lbl.TextColor3=Color3.new(0,1,0)elseif fps>=30 then lbl.TextColor3=Color3.new(1,1,0)else lbl.TextColor3=Color3.new(1,0,0)end end end)
-- Further Reach
local AkaliNotif=loadstring(game:HttpGet("https://raw.githubusercontent.com/ultraskidding/luau/refs/heads/main/AkaliNotif.lua"))()local Notify=AkaliNotif and AkaliNotif.Notify or function()end
local Cfg={Toggle=Enum.KeyCode.Seven,Unload=Enum.KeyCode.Eight,Retries=5,RetryDelay=0.12,Working=false}
local Cool=false local DH local BH
local function ntf(t,dd)pcall(function()Notify({Title=t,Description=dd,Duration=4})end)end
local function waitI()local a=RS:WaitForChild("GamepassEvents",10)local b=RS:WaitForChild("MenuToys",10)return a,b end
local function waitG()local c=LP.Character or LP.CharacterAdded:Wait()c:WaitForChild("Humanoid",5)local gr=c:WaitForChild("GrabbingScript",5)return c,gr end
local function rg()local _,gr=waitG()if not gr then return end gr.Enabled=false task.wait()gr.Enabled=true end
local function fa(ac)for i=1,Cfg.Retries do pcall(function()ac:FireServer()end)task.wait(Cfg.RetryDelay)end end
local function en()
 local gpe,mt=waitI()if not(gpe and mt)then ntf("Further Reach","Instances not found!")return false end
 local sn=gpe:FindFirstChild("FurtherReachBoughtNotifier")local ac=mt:FindFirstChild("LimitedTimeToyEvent")
 if not(sn and ac)then ntf("Further Reach","Missing notify/activator!")return false end
 local old=LP:FindFirstChild("FartherReach")if old then old:Destroy()end
 local mk=Instance.new("BoolValue")mk.Name="FartherReach"mk.Value=true mk.Parent=LP
 sn.Parent=RF ac.Name="FurtherReachBoughtNotifier"ac.Parent=gpe
 rg()task.spawn(fa,ac)
 if DH then DH:Disconnect()end
 DH=LP.CharacterAdded:Connect(function(c)c:WaitForChild("Humanoid",10)c:WaitForChild("GrabbingScript",10)task.wait(0.3)if Cfg.Working then rg()local g2=RS:FindFirstChild("GamepassEvents")if g2 then local a2=g2:FindFirstChild("FurtherReachBoughtNotifier")if a2 then task.spawn(fa,a2)end end end end)
 Cfg.Working=true return true
end
local function dis()
 local old=LP:FindFirstChild("FartherReach")if old then old:Destroy()end
 local gpe=RS:FindFirstChild("GamepassEvents")local mt=RS:FindFirstChild("MenuToys")
 if gpe and mt then local r=gpe:FindFirstChild("FurtherReachBoughtNotifier")if r then r.Name="LimitedTimeToyEvent"r.Parent=mt end end
 rg()if DH then DH:Disconnect()DH=nil end Cfg.Working=false
end
local function tgl(sh)if Cfg.Working then dis()if sh then ntf("Further Reach","Disabled!")end else local ok=en()if sh then ntf("Further Reach",ok and "Activated!"or"Failed!")end end end
task.spawn(function()task.wait(1)if not Cfg.Working then tgl(false)end end)
BH=UIS.InputBegan:Connect(function(input,gp)if gp then return end if input.KeyCode==Cfg.Toggle then if Cool then return end Cool=true tgl(true)task.delay(0.3,function()Cool=false end)elseif input.KeyCode==Cfg.Unload then ntf("Further Reach","Unloading...")if Cfg.Working then dis()end if BH then BH:Disconnect()end end end)
print("✅ Merged client loaded (visual + Further Reach)")
