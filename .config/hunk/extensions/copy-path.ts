import { execFileSync } from "node:child_process";
import type { HunkExtensionAPI } from "hunkdiff/extension";

/** Copy the selected file's repository-relative path to the clipboard with `Y`. */
export default function copyPath(hunk: HunkExtensionAPI) {
  hunk.registerCommand({ id: "copy-path", title: "Copy file path", key: "Y" }, (ctx) => {
    const file = ctx.selection.file;
    if (!file) {
      ctx.notify("No file selected", "warning");
      return;
    }
    try {
      execFileSync("pbcopy", { input: file.path });
      ctx.notify(`Copied: ${file.path}`);
    } catch {
      ctx.notify("Failed to copy (pbcopy unavailable)", "error");
    }
  });
}
