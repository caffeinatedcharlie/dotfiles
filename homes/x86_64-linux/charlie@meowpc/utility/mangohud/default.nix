{
  programs.mangohud = {
    enable = true;
    settings = {
      # Settings

      fps = true;
      position = "top-left";
      legacy_layout = false;
      # GPU
      gpu_stats = true;
      gpu_temp = true;
      gpu_power = true;
      # CPU
      cpu_stats = true;
      cpu_temp = true;
      cpu_power = true;
      # IO
      io_stats = true;
      io_read = true;
      io_write = true;
      # Memory
      swap = true;
      vram = true;
      ram = true;
      procmem = true;
      procmem_shared = true;
      procmem_virt = true;
      # Miscellaneous
      gpu_name = true;
      vulkan_driver = true;
      frame_timing = 0;
      toggle_hud = "Shift_R+F12";

      # Text
      text_outline = false;

      # Theming (Catppuccin Mocha)
      cpu_color = "89B4FA";
      io_color = "F5C2E7";
      vram_color = "CBA6F7";
      ram_color = "CBA6F7";
      engine_color = "F38BA8";
      gpu_color = "A6E3A1";
      wine_color = "F38BA8";
      frametime_color = "A6E3A1";
      media_player_color = "CDD6F4";
      background_alpha = 0.4;
      font_size = 16;
      background_color = "11111b";
      text_color = "cdd6f4";
      round_corners = 0;
    };
  };
}
