# encoding: utf-8
require 'rake'
require 'web_translate_it'
namespace :trans do  
  desc "Fetch translation files from Web Translate It"
  task :fetch, :locale do |task, args|
    WebTranslateIt::Util.welcome_message
    puts "Fetching file for locale #{args.locale}..."
    configuration = WebTranslateIt::Configuration.new
    configuration.files.find_all{ |file| file.locale == args.locale }.each do |file|
      puts file.file_path + ": " + file.fetch
    end
  end
  
  namespace :fetch do
    desc "Fetch all the translation files from Web Translate It"
    task :all do
      WebTranslateIt::Util.welcome_message
      configuration = WebTranslateIt::Configuration.new
      locales = configuration.target_locales
      configuration.ignore_locales.each{ |locale_to_ignore| locales.delete(locale_to_ignore) }
      puts "Fetching all files for all locales..."
      locales.each do |locale|
        configuration.files.find_all{ |file| file.locale == locale }.each do |file|
          puts file.file_path + " " + file.fetch
        end
      end
    end
  end
  
  desc "Upload the translation files for a locale to Web Translate It"
  task :upload, :locale do |task, args|
    WebTranslateIt::Util.welcome_message
    puts "Uploading file for locale #{args.locale}..."
    configuration = WebTranslateIt::Configuration.new
    configuration.files.find_all{ |file| file.locale == args.locale }.each do |file|
      puts file.file_path + " " + file.upload
    end
  end
end
