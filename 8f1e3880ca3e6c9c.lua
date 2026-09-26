-- ts file was generated at discord.gg/25ms

local u = firesignal or function(p1)
    if getconnections then
        for _, v in pairs(getconnections(p1))do
            if v.Function then
                pcall(v.Function)
            end
        end
    end
end
local _PlayerGui = game:GetService('Players').LocalPlayer.PlayerGui
local v4 = function(p2, p3, p4)
    local v1 = tick()
    local v2 = p4 or 10

    while tick() - v1 < v2 do
        local v3 = p2:FindFirstChild(p3)

        if v3 then
            return v3
        end

        task.wait()
    end

    return nil
end
local v7 = function(p5, p6)
    if not p5 then
        warn('Missing: ' .. p6)

        return false
    end

    local v5, v6 = pcall(u, p5)

    if not v5 then
        warn('Fire failed: ' .. p6 .. ' | ' .. v6)
    end

    return v5
end
local v8 = v4(_PlayerGui, 'ShipControlGui')

if v8 then
    v8 = v4(v8:WaitForChild('Menus'), 'DockingRequest')
end
if v8 then
    for _, v9 in pairs(v8:GetChildren())do
        if v9:IsA('TextButton') or v9:IsA('ImageButton') then
            v7(v9.MouseButton1Click, 'DockingRequest')

            break
        end
    end
end

local v10 = v4(_PlayerGui, 'PortGui', 15)
local v11

if v10 then
    v11 = v4(v10, 'LoadingBar')
else
    v11 = v10
end
if v11 then
    repeat
        task.wait()
    until not v11.Visible
end

local v12

if v10 then
    v12 = v4(v10, 'PortMainMenu')
else
    v12 = v10
end
if v12 then
    repeat
        task.wait()
    until v12.Visible

    local v13 = v4(v12, 'MenuButtons')

    if v13 then
        v13 = v4(v13, 'CargoManager')
    end

    repeat
        task.wait()
    until v13 and v13:FindFirstChild('Button')
end

wait(3)

local v14

if v10 then
    v14 = v10.PortMainMenu

    if v14 then
        v14 = v10.PortMainMenu.MenuButtons

        if v14 then
            v14 = v10.PortMainMenu.MenuButtons.CargoManager

            if v14 then
                v14 = v10.PortMainMenu.MenuButtons.CargoManager.Button
            end
        end
    end
else
    v14 = v10
end
if v14 then
    v14 = v14.MouseButton1Click
end

v7(v14, 'CargoManager')
task.wait(1)

local v15

if v10 then
    v15 = v10:FindFirstChild('BulkMenu')
else
    v15 = v10
end

local v16

if v15 then
    v16 = v15:FindFirstChild('ScrollingFrame')
else
    v16 = v15
end
if v16 then
    local v17 = false

    while true do
        local v18 = nil
        local v19 = 'Unknown'

        for _, v20 in pairs(v16:GetChildren())do
            if v20.Name ~= 'AListItem' then
            elseif v20.Visible then
                local _Unload = v20:FindFirstChild('Unload')
                local _Cargo = v20:FindFirstChild('Cargo')

                if _Unload then
                    if _Unload:IsA('TextButton') or _Unload:IsA('ImageButton') then
                        v19 = _Cargo and _Cargo.Text or 'Unknown'
                        v18 = _Unload

                        break
                    end
                end
            end
        end

        if not v18 then
            break
        end

        print('Unloading: ' .. v19)

        if not v7(v18.MouseButton1Click, 'Unload: ' .. v19) then
            break
        end

        v17 = true

        if v11 then
            repeat
                task.wait()
            until not v11.Visible
        end

        task.wait(1.5)
    end

    if v17 then
        print('All cargo unloaded.')
    else
        print('No cargo to unload.')
    end

    wait(2)
else
    warn('BulkMenu.ScrollingFrame not found!')
end
if v15 then
    v15 = v15:FindFirstChild('Back')
end
if v15 then
    v15 = v15.MouseButton1Click
end

v7(v15, 'Back')
task.wait(0.6)

local v21

if v10 then
    v21 = v10.PortMainMenu

    if v21 then
        v21 = v10.PortMainMenu.MenuButtons

        if v21 then
            v21 = v10.PortMainMenu.MenuButtons.Undock

            if v21 then
                v21 = v10.PortMainMenu.MenuButtons.Undock.Button
            end
        end
    end
else
    v21 = v10
end
if v21 then
    v21 = v21.MouseButton1Click
end

v7(v21, 'Undock')

if v11 then
    repeat
        task.wait()
    until not v11.Visible
end

local v22 = v4(_PlayerGui, 'ShipControlGui')

if v22 then
    repeat
        task.wait()
    until v22.Enabled
end

wait(3)
print('Dock \u{2192} Unload All \u{2192} Undock complete!')
