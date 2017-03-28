Database tables, columns, AR relationships and migrations
========================================================
Company

name city state url about

has_many :contacts
has_many :jobs

rails g migration CreateCompanies name:string city:string state:string url:string about:text
==========================
Contact

company_id fname lname title email phone url about history

belongs_to :org
has_many :actions
accepts_nested_attributes_for :org

rails g migration CreateContacts company_id:integer fname:string lname:string role:string about:text email:string phone:string url:string

notes: - all contacts have an Company, default is: name: "network", id: 1
       - switch to another Company, if a network contact becomes a job connected contact
       - store social links, blogs, sites in about column
       - or use 'url' column if appropriate ex: stand alone developer, solo w/no company, but does have their own URL for consulting, etc. 
       - this allows the Contact table to serve: 
            1. Company Contacts
            2. Networking Contacts
            3. Hybrids, or contacts that start as 'network' but turn into 'job' related.
            4. General address book all in one place
==========================
Action

user_id step_id job_id contact_id company_id due_date notes status next_step first_contact

  belongs_to :contact
  belongs_to :job
  belongs_to :org
  belongs_to :step
  belongs_to :user
  has_many :action_logs

rails g migration CreateActions user_id:integer step_id:integer job_id:integer contact_id:integer company_id:integer due_date:date notes:text status:string next_step:string first_contact:boolean
 
note: default step_id: 1 "choose_step!"
============================
Step

name category
has_many :actions

rails g migration CreateSteps name:string category:string

NOTES: 
      categories are: jobsearch, techprep, branding

      jobsearch
      1  choose_step!
      2  research
      3  apply
      4  email
      5  call
      6  meeting
      7  interview
      8  fup

      techprep
      9  study
      10 code
      11 blog
      12 network

      branding (todo: an action to complete each of these fields in Users table)
      13  todo_elevator_pitch.txt
      14  todo_resume.doc
      15  todo_twitter_url
      16  todo_linkedin_url
      17  todo_github_url
      18  todo_learn_student_profile_url
      19  todo_blog_site_url
      20  todo_portfolio_site_url
      21  todo_github commits track with github API
      22  todo_new # add todo, from curriculum

==========================
Job

title  url company_id description requirements instructions

belongs_to :org
has_many :actions
has_many :contacts # this will allow us to call "job.contacts", for related contacts

rails g migration CreateJobs title:string url:string company_id:integer description:text requirements:text  instructions:text 

==========================
Users

name:string email:string phone:string address:string city:string state:string zip:string

coach_name:string coach_email:string coach_phone:string, elevator_pitch:text, resume:object, twitter_url, linkedin_url, github_url, learn_student_profile_url, blog_site_url, portfolio_site_url

==========================================================
Tag

name:string 

has_many :resources

rails g migration CreateTags name:string

==========================================
Resource

name:string format:string location:string description:text tags:string user_id:integer

belongs_to :user
has_many :tags

rails g migration CreateResources name:string format:string location:string user_id:integer description:text tags:string

NOTES: 
      Doc    Pdf    Audio       Video       Wiki
      NOTE:
       # default landing place: root of resources folder
       # create a cleanup method, to move files of type(), to respective folders audio, video, docs
      resource.ext = doc_name.reverse[0..2].reverse
      route files of type 'ext' to appropriate folders

      docs and files can't be too big
      put them on Google docs or Dropbox
      point to them from this app

==========================================================
Doc

file_name:text location:text resource_id:integer

belongs_to :resource

rails g migration file_name:string location:string resource_id:integer
==========================================================
Pdf

file_name:text location:text resource_id:integer

belongs_to :resource

rails g migration file_name:string location:string resource_id:integer
==========================================================
Scrape

file_name:text location:text resource_id:integer

belongs_to :resource

rails g migration file_name:string location:string resource_id:integer

===========================================================
ActionLog

rails g migration CreateActionLogs action_id:integer log_date:date step:string notes:text status:string next_step:string 

belongs_to :action

NOTE:
   These fields are a snapshot in a moment of time, in the life cycle of an action. 
      @action.id
      @action.updated_at
      @action.step.name
      @action.notes
      @action.status
      @action.next_step
===========================================================
UserLog

rails g migration CreateUserLogs user_id:integer log_date:date notes:text

belongs_to :user
has_many :tags

===========================================================



OmniAuth    setup Github, Google, Facebook, Twitter
===========================================================
 
   Tools
            generate emails based on actions past & future
            use github API to get weekly commits
            generate action plans to output to excel
            generate excel data for updating the Job Tracker Magic Spreadsheet
            excel csv staging file for newly acquired leads
            upload via import CSV method
            alert system based on actions and dates
            job quadrant graph based on scores
            company research, build on their API, build something relevant to them


============================================



Activity Dashboard
            Weekly goals: 
            Total 
            Git Commits
            Blog Posts 

Job Search Activity
            Timestamp (PLS DO NOT UPDATE) 
            Company
            Contact Name and Title
            Date
            Action 
            Is this the first time you are contacting this org/contact?
            Job Title
            Link to Job Announcement
            Notes
            "Action Complete?
            - ✓ for Yes
            - Blank for No"
            Next Step
            Status
 
Git Commits and Blog Posts
            Timestamp (PLS DO NOT UPDATE) 
            Date  How Many Git Commits or Blog Posts did you do this week? 
            Please type a number (1 45 0 27 etc)
            "Git Commit or Blog Post"

1 on 1s with Career Coach
            Date
            Notes

Idea Generation on Companies
            Company of interest
            Target Contact
            My contacts who can connect me to this org or to my target person

