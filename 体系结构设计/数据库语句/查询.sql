select r1.replyID,r1.userID,u.userName,r1.replyContent,r1.replyWhich,r2.userID beReplyUser,r2.replyContent beReplyContent,r1.commentID,r1.replyDate
from commentreplylist r1
inner join userinformationlist u
on r1.userID = u.userID
left join commentreplylist r2
on r1.replyWhich = r2.replyID
where r1.commentID = '16'