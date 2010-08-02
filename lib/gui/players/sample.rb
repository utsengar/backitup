module Sample
  def mouse_clicked(e)
    selection = scene.find('the_selection')
    selection.style.background_color = self.style.background_color
  end
end