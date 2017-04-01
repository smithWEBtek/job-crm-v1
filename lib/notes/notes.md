170401
job flow

action    can be linked to job, contact or company, or not, update anytime
  new     shows all action fields
         
  show    shows list of all actions, in tabular data format, with edit/delete links
  edit    shows all action fields, with drop
          shows drop-downs for existing jobs, contacts, companies
          associate any combination of these 3 anytime
          1 action, can have all 3 associations
          if action applies to more than 1 job, contact or company, 
            create a new action for it
            
contact   can be linked to action, job or company, or not, update anytime
company   can be linked to action, job, contact, or not, update anytime

job       must be linked to an EXISTING company
          company must exist: if not exist, create company, then create job

user creates new job at:  /jobs/new
  job stats

jobs/:id shows:
  all the job fields

  all contacts with same company_id
    link to add a contact, using job.company.build
    or add contact generically, without association to company, can update anytime

  all actions with same company_id
    link to add an action, using job.company.build
    or add action generically, without association to company, can update anytime

contacts/:id
  all the contact fields

contacts/:id/edit
  drop downs to link contact with:
    existing company
    existing job
    existing action

  create new action in generic action form
    associate action to contact if desired, or not, can update anytime





170327
--------------
[] decide how and when to trigger an action_log record
[] def action_record_log(action)
      action_log = ActionLog.new(
        action_id: action.id, 
        log_date: action.updated_at,
        step: action.step.name,
        notes: action.notes,
        status: action.status,
        next_step: action.next_step
      )
      if action_log.save
        flash[:message] = "Action current values recorded to action_log."
      else
        render 'users/:id/actions/:id/edit'
      end
    end
    take snapshot of 'action', capturing values corresponding to 'action_log' fields
    save it



      is called upon action.create
      record action 'NOTES', 'updated_at', 'status' and 'action_id'
      is not archived until status = complete, or action is deleted
      action.complete: record status = complete, archived on schedule as set
      action.delete:   record delete date, archived on schedule as set

[]  create action.history method with logs data
      business logic: 
        we record the creation of, updates to, completion of or deletion of all action notes and save them in logs
        the current record of action, contains the latest notes
        the action.history method calls all logs + current notes.
 
 
--------------
[]  user.record method 
      is called upon user.create
      records user 'notes', adds new row with 'notes' and 'user_id'
      retains existing 'notes' data, never archived, until User chooses
      feeds 'user.history' method with 'user.logs' array
[]  create user.history method with logs data
      business logic: 
        record new notes
        retain historical notes
        the current user record, shows the latest version of notes
        the user.history mmethod calls all logs + current user 'notes'

 
[] add user_logs to seeds.db
[] add action_logs to seeds.db

--------------
 

[] design archives table
    setup rake task to dump archive to file for offline storage, on a schedule
    setup download CSV functionality to save archive data for admins and coaches

[] finish basic rails views for Org, Contact, Action, User, Job
[] implement partials 
[]   singular name for edit new and show
[]   plural name for index
[]   copy diet app



OMNIAUTH
[] get OmniAuth working with Github
[] github API to show commits

[] nested forms to show actions for user
[] back to ajax videos to use in the actions nested resource form

README
[] update README with installation steps and seed file instructions
[] document intended business logic
[] setup ERD, installation, app documention in a view


FUTURE FEATURES:
[] 
[] Resource access control, initially via user_id
[] Future: use Pundit for authorizing access to resources
[] Setup MailGun with communications to Coach
[] start incorporating tips from career prep track into todo lists
      user can select tips to turn them into 'Actions'
      Actions then become part of the User's daily awareness
[] Step Methods:
      turn them into triggered behaviors
      prompt User for them, offering breakdown of intermediate action steps that will lead to succes on the current Step
[] text parsing API for grabbing contact info while surfing
[] text parsing of links, prompt to add tags, to build library resources
[] set up GoogleDocs and access to the app, use Avi's BattleDecks lecture









[x] create table: action_logs
[x] create table: user_logs
[x] remove 'history' from contacts table, it will now live in 'logs'
[x] update seeds file with new schema 
 
=======================================

170326
[x] move gems, bundle, .env, notes, ERD tool
[x] verify heroku still works

db
[x] move migrations
[x] install Devise views
[x]  adapt seed file to updated models/tables
[x]    rearrange Steps as: 
[x]       (1)techprep 
[x]       (2)branding
[x]       (3)jobsearch

views
[x] put up basic index views
[x] put up application layout nav links
[x] get basic views working on seed data
[x] add Devise views
[x] get Devise auth working












