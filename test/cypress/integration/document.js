
cy.login('nathantuey@gmail.com', 'thuy1907');

describe('Create Document', function() {
    it('Create a New Document', function() {
      cy.visit('/documents/new')     // 1.
  
      cy.get('input.document-title') // 2.
        .type('My First Document')   // 3.
  
      cy.get('input.document-description')  // 4.
        .type('Hello, world!')   // 5.
  
      cy.contains('Submit')      // 6.
        .click()                 // 7.
  
      cy.url()                   // 8.
        .should('include', '/documents/my-first-document')
  
      cy.get('h1')               // 9.
        .should('contain', 'My First Document')
    })
  })