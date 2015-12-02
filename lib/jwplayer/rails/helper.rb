module JWPlayer::Rails
  module Helper
    DEFAULT_OPTIONS = {
      id: 'jwplayer',
    }

    LICENSE_OPTIONS = {
      license: 'ibokD9hXphW/Ishev3Bwp7ZZ//zIDV1W1bpD0Q=='
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
      options = DEFAULT_OPTIONS.merge(options)

      result = %Q{<div id='#{options[:id]}'></div>
                  <script type='text/javascript'>
                    jwplayer('#{options[:id]}').setup(#{options.except(:id).to_json});
                  </script>
                  }

      result.respond_to?(:html_safe) ? result.html_safe : result
    end
  end
end
