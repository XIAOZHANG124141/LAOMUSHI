-- ts file was generated at discord.gg/25ms

local v1 = firesignal or function(p1)
    if getconnections then
        for _, v in pairs(getconnections(p1))do
            if v.Function then
                pcall(v.Function)
            end
        end
    end
end
local _PlayerGui = game:GetService('Players').LocalPlayer.PlayerGui
local _DockingRequest = _PlayerGui:WaitForChild('ShipControlGui'):WaitForChild('Menus'):WaitForChild('DockingRequest')

for _, v2 in pairs(_DockingRequest:GetChildren())do
    if v2:IsA('TextButton') then
        v1(v2.MouseButton1Click)

        break
    end
end

local _PortGui = _PlayerGui:WaitForChild('PortGui')
local _LoadingBar = _PortGui:WaitForChild('LoadingBar')

repeat
    wait()
until not _LoadingBar.Visible

local _PortMainMenu = _PortGui:WaitForChild('PortMainMenu')

repeat
    wait()
until _PortMainMenu.Visible and _PortMainMenu.MenuButtons.CargoManager.Visible

wait(3)
v1(_PlayerGui.PortGui.PortMainMenu.MenuButtons.CargoManager.Button.MouseButton1Click)
wait(0.5)
v1(_PlayerGui.PortGui.ContainerMenu.SwitchMode.MouseButton1Click)

local _ScrollingFrame = _PlayerGui.PortGui.ContainerMenu:WaitForChild('ScrollingFrame')

repeat
    wait()
until _ScrollingFrame:FindFirstChild('ListItem')

wait(0.5)
v1(_PlayerGui.PortGui.ContainerMenu.ScrollingFrame.ListItem.Unload.MouseButton1Click)

repeat
    wait()
until not _LoadingBar.Visible

wait(3)
v1(_PlayerGui.PortGui.ContainerMenu.Back.MouseButton1Click)
wait(0.5)
v1(_PlayerGui.PortGui.PortMainMenu.MenuButtons.Undock.Button.MouseButton1Click)

repeat
    wait()
until not _LoadingBar.Visible
repeat
    wait()
until _PlayerGui:WaitForChild('ShipControlGui').Enabled

wait(3)
print('Full auto dock \u{2192} unload \u{2192} undock cycle completed!')
