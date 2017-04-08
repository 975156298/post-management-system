# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
 Rails.application.config.assets.precompile += %w(admin.js admin.css comment/comment.js comment/comment.css main/main.js main/main.css search.js land/index.js land/index.css land/register.css
 user_informations/user_information.css user_informations/user_information.js user_center/user_center.js user_center/user_center.css
note_info/note_info.js note_info/note_info.css )
