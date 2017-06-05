<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite/Site1.Master" AutoEventWireup="true" CodeBehind="DocInfo.aspx.cs" Inherits="ClinicSite.MainSite.DocInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Banner" runat="server">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-4 navbar-header">
                    <a class="navbar-brand" style="font-size: 1.6em" href="LogIn.aspx">Районна поліклініка</a>


                </div>
                <ul class="col-md-6 nav navbar-nav">
                    <li ><a href="LogIn.aspx">Головна</a></li>
                    <li class="active"><a href="DocInfo.aspx">Лікарі</a></li>
                    <li><a href="Contacts.aspx">Контакти</a></li>
                    <li><a class="overlay-container" data-toggle="modal" data-target="#room">Кабінет</a></li>
                    <li>
                        <div class="modal fade" id="room" role="dialog" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content small">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
                                        <h4 class="modal-title">Кабінет</h4>
                                    </div>
                                    <div class="modal-body small">
                                        <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
                                        <div class="form-group has-feedback">
                                            <label class="sr-only">Телефон</label>
                                            <asp:TextBox runat="server" type="text" ID="log_phone" CssClass="form-control" placeholder="+38 (ХХХ) ХХХ-ХХ-ХХ"></asp:TextBox>
                                            <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" ClearMaskOnLostFocus="false" Mask="+999999999999" TargetControlID="log_phone" />
                                            <asp:RequiredFieldValidator runat="server" Display="Dynamic" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="12px" ControlToValidate="log_phone"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group has-feedback">
                                            <label class="sr-only">Пароль</label>
                                            <asp:TextBox runat="server" type="password" ID="log_psswrd" CssClass="form-control" placeholder="Введіть пароль"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ErrorMessage="Поле повинно бути заповненим" ForeColor="#dd4242" Font-Size="12px" ControlToValidate="log_psswrd"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:Button runat="server" Text="Ввійти" OnClick="LogInAcc_Click" ID="LogInAcc" CssClass="btn btn-primary btn-sm" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="section">
        <div class="container">
            <div class="col-md-12">
                <div class="col-sm-4">
                    <div class="image-box">
                        <div class="overlay-container">
                            <img src="../assets/doctor2.jpg" alt="" />
                            <a class="overlay" data-toggle="modal" data-target="#oftalmolog-1">
                                <i class="fa fa-search-plus"></i>
                                <span>Офтальмолог</span>
                            </a>
                        </div>
                        <a class="btn btn-default btn-block" data-toggle="modal" data-target="#oftalmolog-1">Олександр Довженко</a>
                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="oftalmolog-1" tabindex="-1" role="dialog" aria-labelledby="oftalmolog-1-label" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
                                    <h4 class="modal-title" id="oftalmolog-1-label">Інформація</h4>
                                </div>
                                <div class="modal-body">
                                    <h3>Олександр Довженко Петрович</h3>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>Український радянський письменник, кінорежисер, кінодраматург, художник, класик світового кінематографу.</p>
                                            <ul>
                                                <li>1934 МКФ у Венеції (Приз, фільм «Іван»)</li>
                                                <li>1941 Сталінська премія (I ступеня, фільм «Щорс»)</li>
                                                <li>1949 МКФ в м. Готвальдові (Премія праці, фільм «Мічурін»)</li>
                                                <li>1949 МКФ в Маріанських Лазнях (Премія за найкращий кольоровий фільм, фільм «Мічурін»)</li>
                                                <li>1949 Сталінська премія (II ступеня, фільм «Мічурін»)</li>
                                                <li>1959 ВКФ (Перша премія автору сценарію (посмертно), фільм «Поема про море»)</li>
                                                <li>1959 Ленінська премія (посмертно, фільм «Поема про море»).</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal end -->
                </div>
                <!---Dowzhenko -->
                <div class="col-sm-4">
                    <div class="image-box">
                        <div class="overlay-container">
                            <img src="../assets/doctor3.jpg" alt="" />
                            <a class="overlay" data-toggle="modal" data-target="#oftalmolog-2">
                                <i class="fa fa-search-plus"></i>
                                <span>Офтальмолог</span>
                            </a>
                        </div>
                        <a class="btn btn-default btn-block" data-toggle="modal" data-target="#oftalmolog-2">Михайло Драгоманов</a>
                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="oftalmolog-2" tabindex="-1" role="dialog" aria-labelledby="oftalmolog-2-label" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
                                    <h4 class="modal-title" id="oftalmolog-2-label">Інформація</h4>
                                </div>
                                <div class="modal-body">
                                    <h3>Михайло Драгоманов Петрович</h3>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>Український публіцист, історик, філософ, економіст, літературознавець, фольклорист, громадський діяч, засновник українського соціалізму, представник відомого роду українських громадських і культурних діячів Драгоманових.</p>
                                            <ul>
                                                <li>Працював учителем географії у 2-й Київській гімназії.</li>
                                                <li>1865 — прийнятий на посаду приват-доцента на кафедру загальної історії історико-філологічного факультету Київського університету Св. Володимира. Читав лекції з історії Стародавнього Сходу, історії та історіографії Стародавньої Греції, історії Стародавнього Риму, Нової історії (доби Реформації та Відродження). Опублікував низку статей зі стародавньої історії.</li>
                                                <li>1870 — захистив магістерську дисертацію на ступінь магістра загальної історії на тему «Питання про історичне значення Римської імперії та Тацит».
                                                                        Після наукового відрядження за кордон у 1873 призначений на посаду штатного доцента.</li>
                                                <li>1875 — звільнений з університету за політичну діяльність.</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal end -->
                </div>
                <!---Dragomanow -->
                <div class="col-sm-4">
                    <div class="image-box">
                        <div class="overlay-container">
                            <img src="../assets/doctor4.jpg" alt="" />
                            <a class="overlay" data-toggle="modal" data-target="#teraupevt-1">
                                <i class="fa fa-search-plus"></i>
                                <span>Терапевт</span>
                            </a>
                        </div>
                        <a class="btn btn-default btn-block" data-toggle="modal" data-target="#teraupevt-1">Ліна Костенко Василівна</a>
                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="teraupevt-1" tabindex="-1" role="dialog" aria-labelledby="teraupevt-1-label" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
                                    <h4 class="modal-title" id="teraupevt-1-label">Інформація</h4>
                                </div>
                                <div class="modal-body">
                                    <h3>Ліна Костенко Василівна</h3>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>Українська письменниця, поетеса-шістдесятниця. Лауреатка Шевченківської премії (1987), Премії Антоновичів (1989), премії Петрарки (1994).</p>
                                            <ul>
                                                <li>«Проміння землі» (1957)</li>
                                                <li>«Вітрила» (1958)</li>
                                                <li>«Мандрівки серця» (1961)</li>
                                                <li>«Зоряний інтеграл» (1963, набір «розсипано»)</li>
                                                <li>«Княжа гора» (1972, збірка не вийшла через заборону з боку радянської цензури)</li>
                                                <li>«Маруся Чурай» (1979, перевидання 1982, 1990)</li>
                                                <li>«Вибране» (1987)</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal end -->
                </div>
                <!---Kostenko -->
                <div class="col-sm-4">
                    <div class="image-box">
                        <div class="overlay-container">
                            <img src="../assets/doctor5.jpg" alt="" />
                            <a class="overlay" data-toggle="modal" data-target="#doc-1">
                                <i class="fa fa-search-plus"></i>
                                <span>Стоматолог</span>
                            </a>
                        </div>
                        <a class="btn btn-default btn-block" data-toggle="modal" data-target="#doc-1">Василь Стус Семенович</a>
                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="doc-1" tabindex="-1" role="dialog" aria-labelledby="doc-1-label" aria-hidden="true">
                        <div class="modal-dialog ">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
                                    <h4 class="modal-title" id="doc-1-label">Інформація</h4>
                                </div>
                                <div class="modal-body">
                                    <h3>Василь Стус Семенович</h3>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>Український радянський письменник, кінорежисер, кінодраматург, художник, класик світового кінематографу.</p>
                                            <ul>
                                                <li>1934 МКФ у Венеції (Приз, фільм «Іван»)</li>
                                                <li>1941 Сталінська премія (I ступеня, фільм «Щорс»)</li>
                                                <li>1949 МКФ в м. Готвальдові (Премія праці, фільм «Мічурін»)</li>
                                                <li>1949 МКФ в Маріанських Лазнях (Премія за найкращий кольоровий фільм, фільм «Мічурін»)</li>
                                                <li>1949 Сталінська премія (II ступеня, фільм «Мічурін»)</li>
                                                <li>1959 ВКФ (Перша премія автору сценарію (посмертно), фільм «Поема про море»)</li>
                                                <li>1959 Ленінська премія (посмертно, фільм «Поема про море»).</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal end -->
                </div>
                <!---Stus -->
                <div class="col-sm-4">
                    <div class="image-box">
                        <div class="overlay-container">
                            <img src="../assets/doctor6.jpg" alt="" />
                            <a class="overlay" data-toggle="modal" data-target="#doc-2">
                                <i class="fa fa-search-plus"></i>
                                <span>Гінеколог</span>
                            </a>
                        </div>
                        <a class="btn btn-default btn-block" data-toggle="modal" data-target="#doc-2">Марія Віллінська</a>
                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="doc-2" tabindex="-1" role="dialog" aria-labelledby="doc-2-label" aria-hidden="true">
                        <div class="modal-dialog ">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
                                    <h4 class="modal-title" id="doc-2-label">Інформація</h4>
                                </div>
                                <div class="modal-body">
                                    <h3>Марія Віллінська Олександрівна</h3>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>Український радянський письменник, кінорежисер, кінодраматург, художник, класик світового кінематографу.</p>
                                            <ul>
                                                <li>1934 МКФ у Венеції (Приз, фільм «Іван»)</li>
                                                <li>1941 Сталінська премія (I ступеня, фільм «Щорс»)</li>
                                                <li>1949 МКФ в м. Готвальдові (Премія праці, фільм «Мічурін»)</li>
                                                <li>1949 МКФ в Маріанських Лазнях (Премія за найкращий кольоровий фільм, фільм «Мічурін»)</li>
                                                <li>1949 Сталінська премія (II ступеня, фільм «Мічурін»)</li>
                                                <li>1959 ВКФ (Перша премія автору сценарію (посмертно), фільм «Поема про море»)</li>
                                                <li>1959 Ленінська премія (посмертно, фільм «Поема про море»).</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal end -->
                </div>
                <!---Віллінська -->
                <div class="col-sm-4">
                    <div class="image-box">
                        <div class="overlay-container">
                            <img src="../assets/doctor7.jpg" alt="" />
                            <a class="overlay" data-toggle="modal" data-target="#doc-3">
                                <i class="fa fa-search-plus"></i>
                                <span>Терапевт</span>
                            </a>
                        </div>
                        <a class="btn btn-default btn-block" data-toggle="modal" data-target="#doc-3">Ольга Кобилянська Юліанівна</a>
                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="doc-3" tabindex="-1" role="dialog" aria-labelledby="doc-3-label" aria-hidden="true">
                        <div class="modal-dialog ">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
                                    <h4 class="modal-title" id="doc-3-label">Інформація</h4>
                                </div>
                                <div class="modal-body">
                                    <h3>Ольга Кобилянська Юліанівна</h3>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>Український радянський письменник, кінорежисер, кінодраматург, художник, класик світового кінематографу.</p>
                                            <ul>
                                                <li>1934 МКФ у Венеції (Приз, фільм «Іван»)</li>
                                                <li>1941 Сталінська премія (I ступеня, фільм «Щорс»)</li>
                                                <li>1949 МКФ в м. Готвальдові (Премія праці, фільм «Мічурін»)</li>
                                                <li>1949 МКФ в Маріанських Лазнях (Премія за найкращий кольоровий фільм, фільм «Мічурін»)</li>
                                                <li>1949 Сталінська премія (II ступеня, фільм «Мічурін»)</li>
                                                <li>1959 ВКФ (Перша премія автору сценарію (посмертно), фільм «Поема про море»)</li>
                                                <li>1959 Ленінська премія (посмертно, фільм «Поема про море»).</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal end -->
                </div>
                <!---Кобилянська -->
                <div class="col-sm-4">
                    <div class="image-box">
                        <div class="overlay-container">
                            <img src="../assets/doctor8.jpg" alt="" />
                            <a class="overlay" data-toggle="modal" data-target="#doc-4">
                                <i class="fa fa-search-plus"></i>
                                <span>Терапевт</span>
                            </a>
                        </div>
                        <a class="btn btn-default btn-block" data-toggle="modal" data-target="#doc-4">Софія Андрухович Юріївна</a>
                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="doc-4" tabindex="-1" role="dialog" aria-labelledby="doc-4-label" aria-hidden="true">
                        <div class="modal-dialog ">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
                                    <h4 class="modal-title" id="doc-4-label">Інформація</h4>
                                </div>
                                <div class="modal-body">
                                    <h3>Софія Андрухович Юріївна</h3>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>Український радянський письменник, кінорежисер, кінодраматург, художник, класик світового кінематографу.</p>
                                            <ul>
                                                <li>1934 МКФ у Венеції (Приз, фільм «Іван»)</li>
                                                <li>1941 Сталінська премія (I ступеня, фільм «Щорс»)</li>
                                                <li>1949 МКФ в м. Готвальдові (Премія праці, фільм «Мічурін»)</li>
                                                <li>1949 МКФ в Маріанських Лазнях (Премія за найкращий кольоровий фільм, фільм «Мічурін»)</li>
                                                <li>1949 Сталінська премія (II ступеня, фільм «Мічурін»)</li>
                                                <li>1959 ВКФ (Перша премія автору сценарію (посмертно), фільм «Поема про море»)</li>
                                                <li>1959 Ленінська премія (посмертно, фільм «Поема про море»).</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal end -->
                </div>
                <!---Андрухович -->
                <div class="col-sm-4">
                    <div class="image-box">
                        <div class="overlay-container">
                            <img src="../assets/doctor9.jpg" alt="" />
                            <a class="overlay" data-toggle="modal" data-target="#doc-5">
                                <i class="fa fa-search-plus"></i>
                                <span>Терапевт</span>
                            </a>
                        </div>
                        <a class="btn btn-default btn-block" data-toggle="modal" data-target="#doc-5">Ольга Косач Петрівна</a>
                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="doc-5" tabindex="-1" role="dialog" aria-labelledby="doc-5-label" aria-hidden="true">
                        <div class="modal-dialog ">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
                                    <h4 class="modal-title" id="doc-5-label">Інформація</h4>
                                </div>
                                <div class="modal-body">
                                    <h3>Ольга Косач Петрівна</h3>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>Український радянський письменник, кінорежисер, кінодраматург, художник, класик світового кінематографу.</p>
                                            <ul>
                                                <li>1934 МКФ у Венеції (Приз, фільм «Іван»)</li>
                                                <li>1941 Сталінська премія (I ступеня, фільм «Щорс»)</li>
                                                <li>1949 МКФ в м. Готвальдові (Премія праці, фільм «Мічурін»)</li>
                                                <li>1949 МКФ в Маріанських Лазнях (Премія за найкращий кольоровий фільм, фільм «Мічурін»)</li>
                                                <li>1949 Сталінська премія (II ступеня, фільм «Мічурін»)</li>
                                                <li>1959 ВКФ (Перша премія автору сценарію (посмертно), фільм «Поема про море»)</li>
                                                <li>1959 Ленінська премія (посмертно, фільм «Поема про море»).</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal end -->
                </div>
                <!---Косач -->
                <div class="col-sm-4">
                    <div class="image-box">
                        <div class="overlay-container">
                            <img src="../assets/doctor9.jpg" alt="" />
                            <a class="overlay" data-toggle="modal" data-target="#doc-6">
                                <i class="fa fa-search-plus"></i>
                                <span>Невропатолог</span>
                            </a>
                        </div>
                        <a class="btn btn-default btn-block" data-toggle="modal" data-target="#doc-6">Микола Фітільов Григорович</a>
                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="doc-6" tabindex="-1" role="dialog" aria-labelledby="doc-6-label" aria-hidden="true">
                        <div class="modal-dialog ">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
                                    <h4 class="modal-title" id="doc-6-label">Інформація</h4>
                                </div>
                                <div class="modal-body">
                                    <h3>Микола Фітільов Григорович</h3>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>Український радянський письменник, кінорежисер, кінодраматург, художник, класик світового кінематографу.</p>
                                            <ul>
                                                <li>1934 МКФ у Венеції (Приз, фільм «Іван»)</li>
                                                <li>1941 Сталінська премія (I ступеня, фільм «Щорс»)</li>
                                                <li>1949 МКФ в м. Готвальдові (Премія праці, фільм «Мічурін»)</li>
                                                <li>1949 МКФ в Маріанських Лазнях (Премія за найкращий кольоровий фільм, фільм «Мічурін»)</li>
                                                <li>1949 Сталінська премія (II ступеня, фільм «Мічурін»)</li>
                                                <li>1959 ВКФ (Перша премія автору сценарію (посмертно), фільм «Поема про море»)</li>
                                                <li>1959 Ленінська премія (посмертно, фільм «Поема про море»).</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal end -->
                </div>
                <!---Фітільов -->
                <div class="col-sm-4">
                    <div class="image-box">
                        <div class="overlay-container">
                            <img src="../assets/doctor9.jpg" alt="" />
                            <a class="overlay" data-toggle="modal" data-target="#doc-7">
                                <i class="fa fa-search-plus"></i>
                                <span>Лор</span>
                            </a>
                        </div>
                        <a class="btn btn-default btn-block" data-toggle="modal" data-target="#doc-7">Панас Рудченко Якович</a>
                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="doc-7" tabindex="-1" role="dialog" aria-labelledby="doc-7-label" aria-hidden="true">
                        <div class="modal-dialog ">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
                                    <h4 class="modal-title" id="doc-7-label">Інформація</h4>
                                </div>
                                <div class="modal-body">
                                    <h3>Панас Рудченко Якович</h3>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>Український радянський письменник, кінорежисер, кінодраматург, художник, класик світового кінематографу.</p>
                                            <ul>
                                                <li>1934 МКФ у Венеції (Приз, фільм «Іван»)</li>
                                                <li>1941 Сталінська премія (I ступеня, фільм «Щорс»)</li>
                                                <li>1949 МКФ в м. Готвальдові (Премія праці, фільм «Мічурін»)</li>
                                                <li>1949 МКФ в Маріанських Лазнях (Премія за найкращий кольоровий фільм, фільм «Мічурін»)</li>
                                                <li>1949 Сталінська премія (II ступеня, фільм «Мічурін»)</li>
                                                <li>1959 ВКФ (Перша премія автору сценарію (посмертно), фільм «Поема про море»)</li>
                                                <li>1959 Ленінська премія (посмертно, фільм «Поема про море»).</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal end -->
                </div>
                <!---Рудченко -->
                 <div class="col-sm-4">
                    <div class="image-box">
                        <div class="overlay-container">
                            <img src="../assets/doctor9.jpg" alt="" />
                            <a class="overlay" data-toggle="modal" data-target="#doc-8">
                                <i class="fa fa-search-plus"></i>
                                <span>Терапевт</span>
                            </a>
                        </div>
                        <a class="btn btn-default btn-block" data-toggle="modal" data-target="#doc-8">Ірена Карпа  Ігорівна</a>
                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="doc-8" tabindex="-1" role="dialog" aria-labelledby="doc-8-label" aria-hidden="true">
                        <div class="modal-dialog ">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
                                    <h4 class="modal-title" id="doc-8-label">Інформація</h4>
                                </div>
                                <div class="modal-body">
                                    <h3>Ірена Карпа  Ігорівна</h3>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>Український радянський письменник, кінорежисер, кінодраматург, художник, класик світового кінематографу.</p>
                                            <ul>
                                                <li>1934 МКФ у Венеції (Приз, фільм «Іван»)</li>
                                                <li>1941 Сталінська премія (I ступеня, фільм «Щорс»)</li>
                                                <li>1949 МКФ в м. Готвальдові (Премія праці, фільм «Мічурін»)</li>
                                                <li>1949 МКФ в Маріанських Лазнях (Премія за найкращий кольоровий фільм, фільм «Мічурін»)</li>
                                                <li>1949 Сталінська премія (II ступеня, фільм «Мічурін»)</li>
                                                <li>1959 ВКФ (Перша премія автору сценарію (посмертно), фільм «Поема про море»)</li>
                                                <li>1959 Ленінська премія (посмертно, фільм «Поема про море»).</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal end -->
                </div>
                <!---Карпа -->
                 <div class="col-sm-4">
                    <div class="image-box">
                        <div class="overlay-container">
                            <img src="../assets/doctor9.jpg" alt="" />
                            <a class="overlay" data-toggle="modal" data-target="#doc-9">
                                <i class="fa fa-search-plus"></i>
                                <span>Гастроентеролог</span>
                            </a>
                        </div>
                        <a class="btn btn-default btn-block" data-toggle="modal" data-target="#doc-9">Іван Левицький Семенович</a>
                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="doc-9" tabindex="-1" role="dialog" aria-labelledby="doc-9-label" aria-hidden="true">
                        <div class="modal-dialog ">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
                                    <h4 class="modal-title" id="doc-9-label">Інформація</h4>
                                </div>
                                <div class="modal-body">
                                    <h3>Іван Левицький Семенович</h3>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>Український радянський письменник, кінорежисер, кінодраматург, художник, класик світового кінематографу.</p>
                                            <ul>
                                                <li>1934 МКФ у Венеції (Приз, фільм «Іван»)</li>
                                                <li>1941 Сталінська премія (I ступеня, фільм «Щорс»)</li>
                                                <li>1949 МКФ в м. Готвальдові (Премія праці, фільм «Мічурін»)</li>
                                                <li>1949 МКФ в Маріанських Лазнях (Премія за найкращий кольоровий фільм, фільм «Мічурін»)</li>
                                                <li>1949 Сталінська премія (II ступеня, фільм «Мічурін»)</li>
                                                <li>1959 ВКФ (Перша премія автору сценарію (посмертно), фільм «Поема про море»)</li>
                                                <li>1959 Ленінська премія (посмертно, фільм «Поема про море»).</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal end -->
                </div>
                <!---Левицький -->
                <div class="col-sm-4">
                    <div class="image-box">
                        <div class="overlay-container">
                            <img src="../assets/doctor9.jpg" alt="" />
                            <a class="overlay" data-toggle="modal" data-target="#doc-10">
                                <i class="fa fa-search-plus"></i>
                                <span>Хірург</span>
                            </a>
                        </div>
                        <a class="btn btn-default btn-block" data-toggle="modal" data-target="#doc-10">Михайло Коцюбинський</a>
                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="doc-10" tabindex="-1" role="dialog" aria-labelledby="doc-9-label" aria-hidden="true">
                        <div class="modal-dialog ">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Закрити</span></button>
                                    <h4 class="modal-title" id="doc-10-label">Інформація</h4>
                                </div>
                                <div class="modal-body">
                                    <h3>Іван Левицький Семенович</h3>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>Український радянський письменник, кінорежисер, кінодраматург, художник, класик світового кінематографу.</p>
                                            <ul>
                                                <li>1934 МКФ у Венеції (Приз, фільм «Іван»)</li>
                                                <li>1941 Сталінська премія (I ступеня, фільм «Щорс»)</li>
                                                <li>1949 МКФ в м. Готвальдові (Премія праці, фільм «Мічурін»)</li>
                                                <li>1949 МКФ в Маріанських Лазнях (Премія за найкращий кольоровий фільм, фільм «Мічурін»)</li>
                                                <li>1949 Сталінська премія (II ступеня, фільм «Мічурін»)</li>
                                                <li>1959 ВКФ (Перша премія автору сценарію (посмертно), фільм «Поема про море»)</li>
                                                <li>1959 Ленінська премія (посмертно, фільм «Поема про море»).</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">Закрити</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal end -->
                </div>
                <!---Коцюбинський -->
            </div>
        </div>
    </div>
</asp:Content>
