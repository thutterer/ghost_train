namespace :logos do
  desc "Generate logo and favicon PNGs"
  task generate: [:environment] do
    require "image_processing/mini_magick"

    svg = <<-SVG
      <svg width="512" height="512">
        <rect x="24" y="24" width="464" height="464" rx="32" ry="32" fill="#{Front.config[:theme_color]}" stroke="none"/>
        <text x="50%" y="75%" dominant-baseline="middle" text-anchor="middle" 
          fill="#{Front.config[:background_color]}" 
          style="font-size: 384px; font-weight: bold;">
          #{Front.config[:name][0]}
        </text>
      </svg>
    SVG
  
    tempfile = Tempfile.new(["logo", ".svg"])
    tempfile.write(svg)
    tempfile.rewind

    [16, 32, 192, 512].each do |size|
      processed = ImageProcessing::MiniMagick
      .source(tempfile.path)
      .resize_to_limit(size, size)
      .transparent("#FFFFFF")
      .convert("png")
      .call destination: "./front/app/assets/images/front/logo_#{size}.png"
    end
  
    puts "Done."
  end
end
