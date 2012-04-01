def increase_font(step = 1, font_name = org.eclipse.jface.resource.JFaceResources::TEXT_FONT, font_registry = org.eclipse.ui.PlatformUI.workbench.theme_manager.current_theme.font_registry)
  data = font_registry.get_font_data(font_name)
  new_data = data.map {|d| org.eclipse.swt.graphics.FontData.new(d.getName(), d.height + step, d.style) }
  font_registry.put(font_name, new_data.to_java(:"org.eclipse.swt.graphics.FontData"))
end
