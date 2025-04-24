if (is_boated || !interaction_visible || o_player.climb_aboard_confirmation) exit;

interactor.set_carried_item(is_carried ? noone : id);
interaction_visible = !is_carried;
