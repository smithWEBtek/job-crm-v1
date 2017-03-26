DATA_orgs = {
  :org_keys =>
    ["name", "city", "state", "url", "about"],
  :orgs => [
    ["Network", "hometown", "homestate", "me.com", "about me"],
    ["Acme", "Albany", "NY", "http://www.acme.com", "Coyote is after you."],
    ["Sears", "Clifton", "NJ", "http://www.sears.com", "Everyting for the home."],
    ["Walmart", "Bentonville", "AK", "http://www.walmart.com", "Always the low price."],
    ["Ace Hardware", "Tulsa", "OK", "http://www.acehardware.com", "Ace is the place for the helpful hardware mammal."],
    ["JB Hunt", "Chicago", "IL", "http://www.jbhunt.com", "Ship it!"],
    ["Pepsi Co", "Louisville", "KY", "http://www.pepsico.com", "You want Pepsi, not Coke"],
    ["Org deleted, please choose a new org."]
  ]
}

def make_orgs
  DATA_orgs[:orgs].each do |org|
    new_org = Org.new
    org.each_with_index do |attribute, i|
      new_org.send(DATA_orgs[:org_keys][i]+"=", attribute)
    end
    new_org.save
  end
end
 
DATA_contacts = {
  :contact_keys =>
    ["org_id", "fname", "lname", "title", "email", "phone", "url", "about", "history"],
  :contacts => [
    [1, "Brad", "Smith", "Owner", "brad@smithwebtek.com", "603-494-4147", "http://www.smithwebtek.com", "Web dev prepping", "working on history..."],
    [1, "Jerry", "Seinfeld", "Star", "jerry@seinfeld.com", "212-313-4234", "http://www.seinfeld.com", "Not that there's anything wrong with that..", "show was on for 9 seasons"],
    [1, "Barney", "Rubble", "Quarry Worker", "barney@rock.com", "243-113-2441", "http://www.rock.com", "Hey Fred! Are bowling or what?", "4,000 yrs ago, Fred and Barney went bowling."],
    [1, "Fred", "Flintstone", "Quarry Boss", "fred@rock.com", "608-495-4887", "http://www.rock.com", "Is dinner ready?", "Fred never met a bronto-burger he didn't like"]
  ]
}

def make_contacts
  DATA_contacts[:contacts].each do |contact|
    new_contact = Contact.new
    contact.each_with_index do |attribute, i|
      new_contact.send(DATA_contacts[:contact_keys][i]+"=", attribute)
    end
    new_contact.save
  end
end

DATA_jobs = {
  :job_keys =>
    ["title", "url", "org_id", "description", "requirements", "instructions"],
  :jobs => [
    ["jr rails dev", "http://www.monster.com?job_id=1", 1, "rails dev needed", "rails, js, ajax", "apply online"],
    ["full stack dev", "http://www.monster.com?job_id=2", 1, "full stack shop", "python, js, ajax, node", "send resume, call HR"],
    ["rails team member", "http://www.monster.com?job_id=3", 1, "rails R us", "rails, js, ajax, ember, SQL", "apply by April 23"],
    ["front end dev", "http://www.monster.com?job_id=4", 1, "pretty sites wanted", "bootstrap, js, css", "apply online, send URLs of your work"],
    ["web dev", "http://www.monster.com?job_id=5", 1, "web dev with strong SQL skills", "wordpress, drupal, SQL Server", "email resume, NO CALLS"],
    ["software engineer", "http://www.monster.com?job_id=6", 1, "application dev with some web aspects", "C#, .NET, rails, js, ajax", "online technical test first"]
  ]
}

def make_jobs
  DATA_jobs[:jobs].each do |job|
    new_job = Job.new
    job.each_with_index do |attribute, i|
      new_job.send(DATA_jobs[:job_keys][i]+"=", attribute)
    end
    new_job.save
  end
end

DATA_steps ={
 :step_keys =>
    ["name", "category"],
  :steps => [
    ["choose_step!", "choose_step!"],
    ["study", "techprep"],
    ["code", "techprep"],
    ["gitcommit", "techprep"],
    ["blog", "techprep"],

    ["elevator_pitch", "branding"],
    ["resume", "branding"],
    ["twitter_url", "branding"],
    ["linkedin_url", "branding"],
    ["github_url", "branding"],
    ["learn_student_profile_url", "branding"],
    ["blog_site_url", "branding"],
    ["portfolio_site_url", "branding"],
    ["git_count_commits_via_API", "branding"],

    ["research", "jobsearch"], 
    ["network", "jobsearch"],
    ["apply", "jobsearch"],
    ["email", "jobsearch"],
    ["call", "jobsearch"],
    ["meeting", "jobsearch"],
    ["interview", "jobsearch"],
    ["fup", "jobsearch"]
  ]
}

def make_steps
  DATA_steps[:steps].each do |step|
    new_step = Step.new
    step.each_with_index do |attribute, i|
      new_step.send(DATA_steps[:step_keys][i]+"=", attribute)
    end
    new_step.save
  end
end
 
DATA_tags ={
 :tag_keys =>
    ["name"],
  :tags => [
    ["read"],
    ["blog"],
    ["networking"],
    ["tutorial"],
    ["meetup"],
    ["ruby"],
    ["branding"],
    ["js"],
    ["rails"],
    ["book"],
    ["tool"],
    ["snippet"]
  ]
}

def make_tags
  DATA_tags[:tags].each do |tag|
    new_tag = Tag.new
    tag.each_with_index do |attribute, i|
      new_tag.send(DATA_tags[:tag_keys][i]+"=", attribute)
    end
    new_tag.save
  end
end

DATA_users ={
 :user_keys =>
    ["email", "password"],
  :users => [
    ["ned@abc.com", "pointer"],
    ["max@abc.com", "pointer"],
    ["skai@abc.com", "pointer"],
    ["kaleo@abc.com", "pointer"],
    ["megan@abc.com", "pointer"],
    ["tenzing@abc.com", "pointer"],
    ["davis@abc.com", "pointer"],
    ["cole@abc.com", "pointer"],
    ["ted@abc.com", "pointer"],
    ["fred@abc.com", "pointer"]
  ]
}

def make_users
  DATA_users[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA_users[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

DATA_resources = {
  :resource_keys =>
    ["name", "format", "location", "description", "user_id"],
  :resources => [
    ["brad-smith-resume-v1", "doc", "lib/assets/resources/docs", "brad's resume v1", 1],
    ["brad-smith-cover-letter-v1", "doc", "lib/assets/resources/docs", "generic cover letter v1", 1],
    ["brad-smith-bio-v1", "doc", "lib/assets/resources/docs", "short bio", 1],
    ["brad-smith-projects-v1", "doc", "lib/assets/resources/docs", "list of projects and participation", 1],
    ["brad-smith-ERD-sample-v1", "pdf", "lib/assets/resources/docs", "ERD from project1", 1],
    ["brad-smith-video-intro-v1", "mp4", "lib/assets/resources/videos", "video intro & coding session", 1]
  ]
}

def make_resources
  DATA_resources[:resources].each do |resource|
    new_resource = Resource.new
    resource.each_with_index do |attribute, i|
      new_resource.send(DATA_resources[:resource_keys][i]+"=", attribute)
    end
    new_resource.save
  end
end

DATA_actions = {
  :action_keys =>
    ["user_id", "step_id", "job_id", "contact_id", "org_id", "due_date", "notes", "status", "next_step", "first_contact"],
  :actions => [
    [1, 1, 1, 1, 1, "2017-04-30", "get on it man!", "active", "meeting", "true"],
    [1, 1, 1, 1, 1, "2017-03-26", "had a good phone interview", "active", "fup", "false"],
    [1, 1, 1, 1, 1, "2017-04-15", "looking for PHP Guru", "active", "email", "true"],
    [1, 1, 1, 1, 1, "2017-04-12", "great Rails shop, jrs welcome", "active", "fup", "false"],
    [1, 1, 1, 1, 1, "2017-03-30", "get on it man!", "active", "call", "true"],
    [1, 1, 1, 1, 1, "2017-05-30", "no data on this yet", "active", "send resume", "false"],
    [1, 1, 1, 1, 1, "2017-04-03", "need to find HR contact", "active", "wait for response 1 week", "false"],
    [1, 1, 1, 1, 1, "2017-03-28", "my friend knows a guy here", "active", "drop this one", "true"]
  ]
}

def make_actions
  DATA_actions[:actions].each do |action|
    new_action = Action.new
    action.each_with_index do |attribute, i|
      new_action.send(DATA_actions[:action_keys][i]+"=", attribute)
    end
    new_action.save
  end
end

# DATA_docs ={
#  :doc_keys =>
#     ["file_name"],
#   :docs => [
#     ["my-resume-v1", "lib/assets/resources/docs/"],
#     ["my-cover-letter-v1", "lib/assets/resources/docs/"],
#     ["30sec-elevator-pitch", "lib/assets/resources/docs/"],
#     ["30sec-describe-my-app", "lib/assets/resources/docs/"],
#     ["references", "lib/assets/resources/docs/"],
#     ["30sec-tech-bio", "lib/assets/resources/docs/"]
#   ]
# }

# def make_docs
#   DATA_docs[:docs].each do |doc|
#     new_doc = Doc.new
#     doc.each_with_index do |attribute, i|
#       new_doc.send(DATA_docs[:doc_keys][i]+"=", attribute)
#     end
#     new_doc.save
#   end
# end

# DATA_pdfs ={
#  :pdf_keys =>
#     ["file_name"],
#   :pdfs => [
#     ["myapp-ERD", "lib/assets/resources/docs/"],
#     ["12steps-to-software-engineering-gig", "lib/assets/resources/docs/"],
#     ["How I Changed Careers to Web Dev", "lib/assets/resources/docs/"],
#     ["Technical Skills Map for 2017 Web Developer", "lib/assets/resources/docs/"],
#     ["myapp-landing-page-screenshot1", "lib/assets/resources/docs/"]
#   ]
# }

# def make_pdfs
#   DATA_pdfs[:pdfs].each do |pdf|
#     new_pdf = Pdf.new
#     pdf.each_with_index do |attribute, i|
#       new_pdf.send(DATA_pdfs[:pdf_keys][i]+"=", attribute)
#     end
#     new_pdf.save
#   end
# end

# DATA_scrapes ={
#  :scrape_keys =>
#     ["file_name", "location"],
#   :scrapes => [
#     ["companies", "lib/assets/resources/docs/"],
#     ["contacts", "lib/assets/resources/docs/"],
#     ["centers_of_influence", "lib/assets/resources/docs/"],
#     ["events", "lib/assets/resources/docs/"],
#     ["rails_shops_near_me", "lib/assets/resources/docs/"],
#     ["javascript_jobs", "lib/assets/resources/docs/"],
#     ["jobs_with_JR_in_title"]
#   ]
# }

# def make_scrapes
#   DATA_scrapes[:scrapes].each do |scrape|
#     new_scrape = Scrape.new
#     scrape.each_with_index do |attribute, i|
#       new_scrape.send(DATA_scrapes[:scrape_keys][i]+"=", attribute)
#     end
#     new_scrape.save
#   end
# end



def main
  make_orgs
  make_contacts
  make_jobs
  make_steps
  make_tags
  make_users
  make_resources
  make_actions
  # make_docs
  # make_pdfs
  # make_scrapes
end

main
