local M = {}

function M.is_todo(line) return string.find(line, "TODO") or string.find(line, "DONE") end

function M.get_indent_level(line)
  if line == nil then return { 1, false } end
  local match = line:match "^(%*+)"
  local count = match and match:len() or 0
  local is_todo = false
  if count > 0 and M.is_todo(line) then is_todo = true end
  return { count, is_todo }
end

function M.calc_todo_indent_level(lines_above_plus_current)
  -- Check the lines from the last one (current line) going up
  local current_line = lines_above_plus_current[#lines_above_plus_current]
  local stars_on_line, is_todo = unpack(M.get_indent_level(current_line))
  if stars_on_line > 0 then
    -- Current line already has stars, respect that indentation level.
    return stars_on_line
  end

  -- Check lines above going upwards
  for index = #lines_above_plus_current - 1, 1, -1 do
    local line = lines_above_plus_current[index]
    stars_on_line, is_todo = unpack(M.get_indent_level(line))
    if stars_on_line > 0 then
      if is_todo then
        return stars_on_line
      else
        -- We found a header above the current line, the todo level should
        -- be that level plus one
        return stars_on_line + 1
      end
    end
  end
  -- If we found no reference, default to indentation level 1
  return 1
end

function M.prepend_stars_to_current_line(nbr_stars)
  local line = vim.api.nvim_get_current_line()
  local new_line = string.rep("*", nbr_stars) .. " TODO " .. line
  vim.api.nvim_set_current_line(new_line)
end

-- The main entry point to bind something to
function M.apply_todo_transformation()
  local line = vim.api.nvim_get_current_line()
  local indent_level, _ = unpack(M.get_indent_level(line))
  if indent_level == 0 then
    -- Note that this method won't trigger the nvim-orgmode TODO event, perhaps
    -- there is some built in mapping that can be used instead.
    local cursor = vim.api.nvim_win_get_cursor(0)
    local current_line_nbr = cursor[1] - 1
    local bufnr = vim.api.nvim_get_current_buf()
    local top_line_nbr = math.max(0, current_line_nbr - 1)
    local lines = vim.api.nvim_buf_get_lines(bufnr, top_line_nbr, current_line_nbr + 1, false)
    M.prepend_stars_to_current_line(M.calc_todo_indent_level(lines))
    vim.cmd "startinsert"
    vim.cmd "normal! $"
  else
    -- Inline require enables unit testing of the rest of the code paths in this file.
    require("orgmode").action "org_mappings.todo_next_state"
  end
end

return M
