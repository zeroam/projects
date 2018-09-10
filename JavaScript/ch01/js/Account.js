function Account(bank, accNo, name, money) {
  //멤버 변수
  this.bank = bank;
  this.accNo = accNo;
  this.name = name;
  this.money = money;


  //멤버 함수
  this.deposit = function(money) {
    this.money += money;
  }
  this.withdraw = function(money) {
    this.money -= money;
  }
  this.show = function() {
    document.write("============================<br/>")
    document.write("은 행 명 : "+bank+"<br/>")
    document.write("계좌번호 : "+accNo+"<br/>")
    document.write("입 금 주 : "+name+"<br/>")
    document.write("현재잔액 : "+money+"<br/>")
    document.write("============================<br/>")
  }
}
