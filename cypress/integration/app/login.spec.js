describe('Logging in', () => {
  describe('Visiting the root', () => {
    it('redirects to the login page', () => {
      cy.visit('/');
      // cy.url().should('include', '/auth/sign_in');
    });
  });

  it('logs you in', () => {
    cy.visit('/');
    cy.get('input[name="teacher[email]"]').type('guims@yopmail.com');
    cy.get('input[name="teacher[password]"]').type('123456');
    cy.get('input[name="commit"]').click();

    // cy.get('.notice').should('contain', 'Signed in successfully.');

    // cy.get('input[value="SIGN OUT"]').click();
  });
});
