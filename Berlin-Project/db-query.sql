#select * from reward_details;

CREATE  TABLE IF NOT EXISTS `reward_details` (
  `id` BIGINT,
  `Channel` VARCHAR(15) NOT NULL,
  `Reward` VARCHAR(100) NOT NULL
   );
   insert into reward_details (`id`,`channel`,`Reward`) values(888001,'SPORTS','CHAMPIONS_LEAGUE_FINAL_TICKET');
   insert into reward_details (`id`,`Channel`,`Reward`) values(888001,'KIDS','N/A');
   insert into reward_details (`id`,`Channel`,`Reward`) values(888001,'MUSIC','KARAOKE_PRO_MICROPHONE');
   insert into reward_details (`id`,`Channel`,`Reward`) values(888001,'NEWS','N/A');
   insert into reward_details (`id`,`Channel`,`Reward`) values(888001,'MOVIES','PIRATES_OF_THE_CARIBBEAN_COLLECTION');
   
   insert into reward_details (`id`,`Channel`,`Reward`) values(888002,'SPORTS','CHAMPIONS_LEAGUE_FINAL_TICKET');
   insert into reward_details (`id`,`Channel`,`Reward`) values(888002,'KIDS','N/A');
   
   insert into reward_details (`id`,`Channel`,`Reward`) values(888003,'KIDS','N/A');
   insert into reward_details (`id`,`Channel`,`Reward`) values(888003,'MUSIC','KARAOKE_PRO_MICROPHONE');
   
   insert into reward_details (`id`,`Channel`,`Reward`) values(888004,'NEWS','N/A');
   insert into reward_details (`id`,`Channel`,`Reward`) values(888004,'MOVIES','PIRATES_OF_THE_CARIBBEAN_COLLECTION');
   
   insert into reward_details (`id`,`Channel`,`Reward`) values(888005,'SPORTS','CHAMPIONS_LEAGUE_FINAL_TICKET');
   
   
   
   
   
create database channel_db;

CREATE  TABLE IF NOT EXISTS `acct_detail` (
  `id` BIGINT UNSIGNED AUTO_INCREMENT,
  `Eligible` VARCHAR(5) NOT NULL,
   PRIMARY KEY (`id`));
   insert into acct_detail (`id`,`Eligible`) values(888001,'yes');
   insert into acct_detail (`id`,`Eligible`) values(888002,'yes');
   insert into acct_detail (`id`,`Eligible`) values(888003,'yes');
   insert into acct_detail (`id`,`Eligible`) values(888004,'yes');
   insert into acct_detail (`id`,`Eligible`) values(888005,'no');
 
 select * from acct_detail;