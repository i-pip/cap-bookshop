using { pip.capire.bookshop as my } from '../db/schema';

@requires : "authenticated-user"
service CatalogService @(path : '/browse') {
  @readonly
  entity Books  as
    select from my.Books {
      * ,
      author.name as author
    }
    excluding {
      createdBy,
      modifiedBy
    };

  @requires_ : 'authenticated-user'
  @insertonly
  entity Orders as projection on my.Orders;
}