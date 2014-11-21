module ApplicationHelper

# http://hivelogic.com/articles/random-image-rotation-in-rails
  def random_image
    image_files = %w( .jpg .gif .png )
    files = Dir.entries(
      Rails.root.to_s + "/app/assets/images/headers/" 
    ).delete_if { |x| !image_files.index(x[-4,4]) }
    files[rand(files.length)]
  end

end
