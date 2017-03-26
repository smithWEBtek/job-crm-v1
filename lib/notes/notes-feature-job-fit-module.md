notes-feature-job-fit-module.md

 
 notes: futureFeature:

 add "job_fit" module:
      fields:     learning:integer skills:integer networking:integer location:integer salary:integer
      assign a rank to these fields based on User preferences
      assign a weight to each of these, in terms of impact on job preference

            job_fit_score =(a*b)
            a=1-5 rank
            b=%   weight

            35 %  learning: mentoring & training
            35 %  skills: tech exposure & chops building & working with desired technologies
            15 %  networking: connections & future job growth options
            10 %  location, commute, physical constraints, remote work mix(prefer onsite for first 1-2 years)
            5  %  salary:

      seed data notes: 
            contact_id 1 = 'me' (replace with devise User model)
            job_id 1 = 'TODO' (simplifies things, if your task is not for a job, it defaults to a ToDo)
            company_ID 1 = 'NETWORK'