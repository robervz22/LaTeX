function dydt = negative_feedback_dde(~,y, Z,k, S)

dydt =[k(1)*S-k(2)*y(1)-k(3)*y(1)*y(2); % the consentration of pSTAT3
       k(4)*Z(1)-k(5)*y(2)];     % the consentration of our negative regulator (SOCS3?)

  