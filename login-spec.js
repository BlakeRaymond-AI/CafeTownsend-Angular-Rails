describe('cafetownsend homepage', function() {
  var AppPage = 'http:/cafetownsend.herokuapp.com';

  beforeEach(function () {
    browser.manage().window().setSize(1600, 1000);
  });

  function login() {
    element(by.model('loginCtrl.user.name')).clear().then(function() {
      element(by.model('loginCtrl.user.name')).sendKeys("Luke");
    });
    element(by.model('loginCtrl.user.password')).clear().then(function() {
      element(by.model('loginCtrl.user.password')).sendKeys("Skywalker");
    });
    element.all(by.css('.main-button')).get(1).click();
  }

  it('should have a title', function() {
    browser.get(AppPage);

    expect(browser.getTitle()).toEqual('CafeTownsend-AngularJS-Rails');
  });

  it('should login', function() {
    browser.get(AppPage);
    login();

    expect(browser.getCurrentUrl()).toContain('/employees');
  });
});
