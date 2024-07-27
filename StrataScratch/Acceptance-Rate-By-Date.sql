--1. date of the action = sent 2. same user_id_sender & user_id_receiver 3. that are accepted
--if the action of user_id_sender,user_id_receiver sent of that date is accepted

with accept as(
select a.date, count(*) tots
from fb_friend_requests a , fb_friend_requests b
    where a.user_id_sender = b.user_id_sender 
        AND a.user_id_receiver = b.user_id_receiver 
        AND a.action != b.action 
        AND a.action = 'sent'
    group by a.date
),
total as(
select date,count(action) tots
from fb_friend_requests
where action = 'sent'
group by date)

select accept.date, CAST(accept.tots AS float) / total.tots percentage_acceptance from accept 
    join total on accept.date = total.date
;
