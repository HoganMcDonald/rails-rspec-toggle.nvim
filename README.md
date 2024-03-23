# rails-rspec-toggle.nvim

rails-rspec-toggle.nvim is a Neovim plugin written in Lua designed to enhance productivity for Ruby on Rails developers. It was inspired by [rails-rspec-file-toggle](https://github.com/malt03/rails-rspec-file-toggle) for vscode. It allows you to swiftly toggle between your application files and their corresponding spec files with a simple keybinding.

## Features

- **Easy Toggling:** Switch between your Rails app files and spec files with a single command.
- **Customizable Keybindings:** Set your own keybindings to toggle files.
- **Rails Generators:** Makes use of Rails generators to create spec files so you end up with more than just an empty file.

## Installation

rails-rspec-toggle.nvim can be installed with [lazy.nvim](https://github.com/folke/lazy.nvim).

```lua
  {
    'HoganMcDonald/rails-rspec-toggle.nvim',
    keys = {
      {
        '<leader>tt',
        function()
          require('rails-rspec-toggle').toggle()
        end,
        desc = 'Toggle rspec test file',
      },
    },
  }

```

## Configuration

Below is the default configuration.

```lua
opts = {
  spec_directory = 'spec',
  spec_file_suffix = '_spec.rb',
  generator_map = {
    channel = 'rspec:channel',
    controller = 'rspec:controller',
    helper = 'rspec:helper',
    job = 'rspec:job',
    mailer = 'rspec:mailer',
    model = 'rspec:model',
    view = 'rspec:view',
  }
}
```

- **spec_directory:** The directory your rspec suite exists in.
- **spec_file_suffix:** The file name suffix of your rspec files.
- **generator_map:** A dictionary that maps Rails generators to their respective subdirectories.


## Usage

No keybindings are set by default. If you wish to set keybindings, follow the example in the installation section. You can also call `:lua require('rails-rspec-toggle').toggle()` to toggle between your application files and their corresponding spec files.

If you are in an app file (e.g., app/models/user.rb), calling `toggle` will open spec/models/user_spec.rb, and vice versa.

## Contributing

Contributions to rails-rspec-toggle.nvim are welcome! If you have suggestions for improvements or bug fixes, please open an issue or a pull request.

## License

rails-rspec-toggle.nvim is released under the MIT License. See the LICENSE file for more details.
