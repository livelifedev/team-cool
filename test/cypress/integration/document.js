
describe('Create New Document', function() {
    it('Create New Doc', function() {
        cy.login()
        cy.visit('/documents/new')
        cy.get('[id="document_title"]').type("Ancient History")
        cy.get('[id="document_description"]').type("How the Roman Empire fell")
        cy.get('[id="document_doc_type_essay"]').click()
        cy.get('[type="submit"]').click()
    })
})
