module MalonesHelper
  def svg(name)
    file_path = "#{Rails.root}/app/assets/images/#{name}"
    p file_path
    return File.read(file_path).html_safe if File.exists?(file_path)
    '(not found)'
  end

  def random_pastel
    ["flamingo", "sky", "purps", "grassy", "salmon"].sample
  end
end
