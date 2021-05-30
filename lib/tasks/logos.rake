namespace :logos do
  desc "Generate logo and favicon PNGs from app name"
  task generate: [:environment] do
    require "image_processing/mini_magick"

    svg = <<-SVG
      <svg width="512" height="512">
        <rect x="24" y="24" width="464" height="464" rx="32" ry="32" fill="#{Front.config[:theme_color]}" stroke="none"/>
        <text x="50%" y="50%" dominant-baseline="middle" text-anchor="middle"
          fill="#{Front.config[:background_color]}"
          style="font-size: 384px; font-weight: bold;">
          #{Front.config[:name][0]}
        </text>
      </svg>
    SVG

    tempfile = Tempfile.new(["logo", ".svg"])
    tempfile.write(svg)
    tempfile.rewind

    dir = "./app/assets/images/front"
    [16, 32, 180, 192, 512].each do |size|
      processed = ImageProcessing::MiniMagick
      .source(tempfile.path)
      .resize_to_limit(size, size)
      .transparent("#FFFFFF")
      .convert("png")
      .call destination: "#{dir}/logo_#{size}.png"
    end

    system("cp #{dir}/logo_512.png #{dir}/logo_large.png")
    puts "Done."
  end

  desc "Convert logo and favicon PNGs from SVG file"
  task convert: [:environment] do
    require "image_processing/mini_magick"

    [16, 32, 192, 512].each do |size|
      processed = ImageProcessing::MiniMagick
      .source("./app/assets/images/front/logo.svg")
      .resize_to_limit(size, size)
      # .fuzz("5%")
      # TODO: Improve transparency
      .channel("rgba")
      .transparent("rgba(0,0,0,0)")
      .background("rgba(0,0,0,0)")
      .convert("png")
      .call destination: "./app/assets/images/front/logo_#{size}.png"
    end

    puts "Done."
  end
end
