require  'github_summarizer/version'
require 'github_api'
require 'colorize'

module GH 
  class Summarizer
    def summarize
      username = ARGV[0]
      github = Github.new user: username
      repos = github.repos.list

      star = "\u2605"

      max_name_len = max_star_len = max_lang_len = 0
      repos.each { |repo| 
        max_name_len = repo['name'].length if repo['name'].length > max_name_len 
        max_star_len = repo['stargazers_count'].to_s.length if repo['stargazers_count'].to_s.length > max_star_len
        if repo['language']
          max_lang_len = repo['language'].length if repo['language'].length > max_lang_len
        end
      }



      user = github.users.get user: username
      puts "#{user['name'].red} (#{user['login'].red})"
      puts "Following: #{user['following']}, Followers: #{user['followers']}"
      puts "\n"
      format="#{star.encode('utf-8').yellow} %-#{max_star_len}s\t%-#{max_name_len}s\t%-#{max_lang_len}s\n"
      repos.each { |repo|
        printf(format, repo['stargazers_count'].to_s.yellow, repo['name'], repo['language'].to_s.blue)
      }
    end
  end
end
