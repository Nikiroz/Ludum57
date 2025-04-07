if (is_boated || !interaction_visible) exit;

interactor.set_carried_item(is_carried ? noone : id);
interaction_visible = !is_carried;