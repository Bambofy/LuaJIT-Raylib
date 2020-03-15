ffi = require("ffi")
raylib = require("raylib")
raygui = require("raygui")


function Main()
    print("Loading raylib...")

    raylib.InitWindow(800, 600, "test")

    raylib.SetTargetFPS(60);

    raygui.GuiEnable();

    local windowRectangle = ffi.new("Rectangle", { 0, 0, 300, 300 }) -- this is how to create objects (since they are structs)
    local windowTop = ffi.new("Rectangle", {0, 0, 300, 20}) -- the top bar of the gui

    local dragged = false

    while not raylib.WindowShouldClose() do
        raylib.BeginDrawing();

        raylib.ClearBackground(RAYWHITE)

        -- check if its clicked on           
        raygui.GuiWindowBox(windowRectangle, "window test")
        
        raylib.EndDrawing();
    end
end

Main()