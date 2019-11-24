# Copyright 2018 - Thomas T. Jarløv

import
  asyncdispatch,
  asyncnet,
  db_sqlite,
  os,
  osproc,
  parseCfg,
  strutils,
  uri

import ../../nimwcpkg/sessions/sessions
import ../../nimwcpkg/plugins/plugins


proc pluginInfo() =
  let (n, v, d, u) = pluginGetDetails("themes")
  echo " "
  echo "--------------------------------------------"
  echo "  Package:      " & n
  echo "  Version:      " & v
  echo "  Description:  " & d
  echo "  URL:          " & u
  echo "--------------------------------------------"
  echo " "
pluginInfo()


include "html.tmpl"


proc themesStart*(db: DbConn) =
  ## Required proc. Will run on each program start
  ##
  ## If there's no need for this proc, just
  ## discard it. The proc may not be removed.

  echo "Themes: Copying style_custom.css to plugin folder"

  if not fileExists("plugins/themes/stylesheets/style_custom.css"):
    discard execCmd("cp public/css/style_custom.css plugins/themes/stylesheets/style_custom.css")
  else:
    echo "Themes: style_custom.css already exists in plugin folder - skipping"