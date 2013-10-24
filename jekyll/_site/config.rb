# Require any additional compass plugins here.

# Set this to the root of your project when deployed:
http_path = "/"
css_dir = "css"
sass_dir = "sass"
images_dir = "img"
javascripts_dir = "js"
fonts_dir = "font"

# enviroment = :development
enviroment = :production

if enviroment == :development
    output_style = :expanded
    line_comments = true
    sass_options = {:sourcemap => true}
    enable_sourcemaps = true

elsif enviroment == :production
    output_style = :compressed
    line_comments = false
    enable_sourcemaps = false
end