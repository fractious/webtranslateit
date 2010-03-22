require File.join(File.dirname(__FILE__), 'web_translate_it', 'util')
require File.join(File.dirname(__FILE__), 'web_translate_it', 'configuration')
require File.join(File.dirname(__FILE__), 'web_translate_it', 'translation_file')
require File.join(File.dirname(__FILE__), 'web_translate_it', 'auto_fetch')
require File.join(File.dirname(__FILE__), 'web_translate_it', 'command_line')
require File.join(File.dirname(__FILE__), 'web_translate_it', 'project')

module WebTranslateIt
  
  def self.fetch_translations
    config = Configuration.new
    locale = I18n.locale.to_s
    return if config.ignore_locales.include?(locale)
    config.logger.debug { "➔  Fetching #{locale.upcase} language file(s) from Web Translate It…" } if config.logger
    config.files.find_all{ |file| file.locale == locale }.each do |file|
      config.logger.debug { "➔  Web Translate It response: #{file.fetch}" } if config.logger
    end
  end
end
