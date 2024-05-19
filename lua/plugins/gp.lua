local function capture_command_output(cmd)
  local handle = io.popen(cmd)
  if handle then
    local result = handle:read "*a"
    handle:close()
    return string.gsub(result, "%s+", "")
  else
    print "Failed to read OPENAI key"
    return nil
  end
end

return {
  "robitx/gp.nvim",
  keys = {
    { mode = { "n" }, "<Leader>an", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat" },
    { mode = { "n" }, "<Leader>at", "<cmd>GpChatToggle<cr>", desc = "Toggle" },
    { mode = { "n" }, "<Leader>ar", "<cmd>GpChatRespond<cr>", desc = "Respond" },
    { mode = { "n" }, "<Leader>af", "<cmd>GpChatFinder<cr>", desc = "Find chat" },
    { mode = { "n", "v" }, "<Leader>as", "<cmd>GpStop<cr>", desc = "Stop generation" },

    { mode = "v", "<Leader>ap", ":<C-u>'<,'>GpChatPaste<cr>", desc = "Visual Chat Paste" },
    { mode = "v", "<Leader>at", ":<C-u>'<,'>GpChatToggle<cr>", desc = "Visual Toggle Chat" },
  },

  opts = function()
    return {
      openai_api_key = capture_command_output(os.getenv "HOME" .. "/.config/echo-openai-key.sh"),
      agents = {
        {
          name = "ChatGPT4",
          chat = true,
          command = true,
          model = "gpt-4o",
          system_prompt = "You are a general AI assistant.\n\n"
            .. "The user provided the additional info about how they would like you to respond:\n\n"
            .. "- If you're unsure don't guess and say you don't know instead.\n"
            .. "- Ask question if you need clarification to provide better answer.\n"
            .. "- Think deeply and carefully from first principles step by step.\n"
            .. "- Zoom out first to see the big picture and then zoom in to details.\n"
            .. "- Use Socratic method to improve your thinking and coding skills.\n"
            .. "- If the answer does not need to be lengthy, keep it short.\n"
            .. "- Don't elide any code from your output if the answer requires coding.\n"
            .. "- Take a deep breath; You've got this!\n",
        },
      },
    }
  end,
  config = function(_, opts)
    local gp = require "gp"
    gp.setup(opts)
    gp._state.chat_agent = "ChatGPT4"
  end,
}
