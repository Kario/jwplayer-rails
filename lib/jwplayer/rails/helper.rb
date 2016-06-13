module JWPlayer::Rails
  module Helper
    def default_options
      {
          id: 'jwplayer',
          flashplayer: asset_path('jwplayer.flash.swf')
      }
    end
    LICENSE_OPTIONS = {
      license: '2fGnbPrIFMn1QYwDDGxe96RS4XKCDeH0NPXHG2r6VCA='
    }

    # Includes JWPlayer javascript library
    def jwplayer_assets
      javascript_include_tag "jwplayer"
    end

    # Includes JWPlayer license
    def jwplayer_license(options = {})
      options = LICENSE_OPTIONS.merge(options)
      javascript_tag "jwplayer.key='#{options[:license]}';"
    end

    def jwplayer(options = {})
      options = default_options.merge(options)

      result = %Q{<div id='#{options[:id]}'></div>
                  <script type='text/javascript'>
                    jwplayer('#{options[:id]}').setup(#{options.except(:id).to_json});
                  </script>
                  }

      result.respond_to?(:html_safe) ? result.html_safe : result
    end
  end
end
