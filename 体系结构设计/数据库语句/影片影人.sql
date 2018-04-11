INSERT INTO moviemarklist(movieID,userID,markScore,markContent,markDate) 
VALUES(5,5,10,'zzzzzzzzzzzzzzzzzzzzzzzz',now())
ON DUPLICATE KEY UPDATE markContent='123456',markDate=now(),markScore='2';
