  get "/themes/settings":
    createTFD()
    if c.loggedIn and c.rank in [Admin, Moderator]:
      resp genMain(c, genThemesSettings(c, @"msg"))

  get "/themes/apply":
    createTFD()
    if c.loggedIn and c.rank in [Admin, Moderator]:
      let sheetName = @"stylesheetname"

      # Copy stylesheet to public folder
      discard execCmd("cp plugins/themes/stylesheets/" & sheetName & " public/css/style_custom.css")

      redirect("/themes/settings")

  get "/themes/newstylesheet":
    createTFD()
    if c.loggedIn and c.rank in [Admin, Moderator]:
      if @"stylesheetname" == "":
        redirect("/themes/settings?msg=" & encodeUrl("Missing new name"))

      if @"stylesheetname" == "style.css":
        redirect("/themes/settings?msg=" & encodeUrl("The name may be style.css"))

      discard execCmd("cp public/css/style_custom.css plugins/themes/stylesheets/" & @"stylesheetname" & ".css")
      redirect("/themes/settings")

  get "/themes/update":
    createTFD()
    if c.loggedIn and c.rank in [Admin, Moderator]:
      let sheetName = @"stylesheetname"

      discard execCmd("cp public/css/style_custom.css plugins/themes/stylesheets/" & sheetName)
      redirect("/themes/settings")

  get "/themes/delete":
    createTFD()
    if c.loggedIn and c.rank in [Admin, Moderator]:
      let sheetName = @"stylesheetname"

      discard execCmd("rm plugins/themes/stylesheets/" & sheetName)
      redirect("/themes/settings")