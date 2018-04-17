DATA_companies = {
  :company_keys =>
    ["name", "city", "state", "url", "about"],
  :companies => [
    ["Network", "hometown", "homestate", "me.com", "about me"],
    ["Acme", "Albany", "NY", "http://www.acme.com", "Coyote is after you."],
    ["Sears", "Clifton", "NJ", "http://www.sears.com", "Everything for the home."],
    ["Walmart", "Bentonville", "AK", "http://www.walmart.com", "Always the low price."],
    ["Ace Hardware", "Tulsa", "OK", "http://www.acehardware.com", "Ace is the place for the helpful hardware mammal."],
    ["JB Hunt", "Chicago", "IL", "http://www.jbhunt.com", "Ship it!"],
    ["Pepsi Co", "Louisville", "KY", "http://www.pepsico.com", "You want Pepsi, not Coke"],
    ["deleted"]
  ]
}

def make_companies
  DATA_companies[:companies].each do |company|
    new_company = Company.new
    company.each_with_index do |attribute, i|
      new_company.send(DATA_companies[:company_keys][i]+"=", attribute)
    end
    new_company.save
  end
end
 
DATA_contacts = {
  :contact_keys =>
    ["company_id", "fname", "lname", "title", "email", "phone", "url", "about"],
  :contacts => [
    [1, "Brad", "Smith", "Owner", "brad@smithwebtek.com", "603-494-4147", "http://www.smithwebtek.com", "Web dev prepping"],
    [1, "Jerry", "Seinfeld", "Star", "jerry@seinfeld.com", "212-313-4234", "http://www.seinfeld.com", "Not that there's anything wrong with that.."],
    [1, "Barney", "Rubble", "Quarry Worker", "barney@rock.com", "243-113-2441", "http://www.rock.com", "Hey Fred! Are bowling or what?"],
    [1, "Fred", "Flintstone", "Quarry Boss", "fred@rock.com", "608-495-4887", "http://www.rock.com", "Is dinner ready?"]
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
    ["title", "url", "company_id", "description", "requirements", "instructions"],
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

DATA_todos = {
  :todo_keys =>
    ["user_id", "step_id", "job_id", "contact_id", "company_id", "due_date", "description", "priority"],
  :todos => [
    [1, 2, 1, 1, 1, "2017-03-26", "get on it man!", 1],
    [1, 3, 2, 2, 1, "2017-03-26", "had a good phone interview", 2],
    [2, 1, 3, 3, 1, "2017-04-15", "looking for PHP Guru", 3],
    [2, 4, 4, 4, 1, "2017-04-12", "great Rails shop, jrs welcome", 4],
    [3, 10, 5, 1, 1, "2017-03-30", "get on it man!", 1],
    [3, 16, 1, 2, 1, "2017-05-30", "no data on this yet", 2],
    [4, 17, 2, 4, 1, "2017-04-03", "need to find HR contact", 3],
    [4, 18, 3, 3, 1, "2017-03-28", "my friend knows a guy here", 1]
  ]
}

def make_todos
  DATA_todos[:todos].each do |todo|
    new_todo = Todo.new
    todo.each_with_index do |attribute, i|
      new_todo.send(DATA_todos[:todo_keys][i]+"=", attribute)
    end
    new_todo.save
  end
end
 
def main
  make_companies
  make_contacts
  make_jobs
  make_steps
  make_users
  make_todos
end

main
