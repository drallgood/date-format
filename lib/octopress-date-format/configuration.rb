module Octopress
  unless defined? Octopress.config
    def self.config
      file = '_octopress.yml'
      if File.exist?(file)
        SafeYAML.load_file(file) || {}
      else
        {}
      end
    end
  end

  module LinkBlog
    module Configuration
      DEFAULTS = {
        'date_format' => 'ordinal',
      }

      def self.config
        @config ||= Jekyll::Utils.deep_merge_hashes(DEFAULTS, Octopress.config)
      end
    end
  end
end

