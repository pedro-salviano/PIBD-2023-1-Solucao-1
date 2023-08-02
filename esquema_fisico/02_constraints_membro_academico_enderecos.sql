ALTER TABLE andifes.membro_academico_enderecos
ADD CONSTRAINT membro_academico_identidade FOREIGN KEY (identidade) REFERENCES membro_academico (identidade);

ALTER TABLE andifes.membro_academico_enderecos
ADD CONSTRAINT PK_membro_academico_enderecos PRIMARY KEY (membro_academico_identidade,
                                                            complemento,
                                                            codigo_postal,
                                                            pais,
                                                            estado,
                                                            cidade,
                                                            bairro,
                                                            rua,
                                                            numero
                                                        );