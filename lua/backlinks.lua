local M = {}

local function is_excluded(dirname)
	local exclude_pattern = vim.g.backlinks_exclude_pattern
	if exclude_pattern ~= nil then
		-- Check if the directory name matches the exclude pattern
		local match = string.match(dirname, exclude_pattern)
		return match ~= nil
	end
	return false
end

function M.find_files_back_linked(dirname)
	-- Get current filename
	local filename = vim.fn.expand("%:t")

	-- Search directory
	dirname = dirname or vim.g.backlinks_search_dir

	-- Files to be searched
	local files = vim.tbl_filter(function(name)
		return not is_excluded(name) and vim.fn.isdirectory(name) == 0 -- 0 is file, 1 is directory
	end, vim.fn.globpath(dirname, "**/*", true, true))

	local results = {}

	for _, file in ipairs(files) do
		local lines = vim.fn.readfile(file)

		for lnum, line in ipairs(lines) do
			if string.match(line, filename) then
				table.insert(results, {
					filename = file,
					lnum = lnum,
					col = 0,
					text = line,
				})
			end
		end
	end

	-- Empty results
	if #results == 0 then
		vim.cmd([[echohl ErrorMsg]])
		vim.cmd([[echomsg 'No files back linked to current file found in directory ]] .. dirname .. "'")
		vim.cmd([[echohl None]])
	else
		-- Set the location list
		vim.fn.setloclist(0, results)

		-- Open the location list window
		vim.cmd("lopen")
	end
end

return M
