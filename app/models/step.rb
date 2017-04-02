class Step < ApplicationRecord
  has_many :todos

  def tech_prep
    # study
    # code
    # blog
  end

  def branding    # (user.todos.build to complete each of these fields in Users table)
    # todo_elevator_pitch
    # todo_resume?
    # todo_twitter_url?
    # todo_linkedin_url?
    # todo_github_url?
    # todo_learn_student_profile_url?
    # todo_blog_site_url?
    # todo_portfolio_site_url?
    # todo_github_API_track_commits
  end

  def job_search(student)
    # research
    # network
  end

  def job_apply
    # job_instructions_todo_steps_created?
    # job_instructions_todos_completed?
    # job_org_contact_info_entered?
  end

  def job_interview
    # meet
    # interview
    # fup
  end

  def job_offer
    # job_analyze(job_data)
  end

  def job_analyze
    # profile rank (see lib/notes/notes-feature-job-fit-module.md)
  end
end
