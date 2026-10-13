package org.asciidoctor.extension;

import java.util.HashMap;
import java.util.Map;

import org.asciidoctor.ast.StructuralNode;

@Name("list")
public class ListCreatorBlockMacro extends BlockMacroProcessor {

    String context;

    public ListCreatorBlockMacro(String context) {
        this.context = context;
    }

    @Override
    public StructuralNode process(StructuralNode parent, String target, Map<String, Object> attributes) {

        Map<String, Object> attrs = new HashMap<String, Object>();
        attrs.put("start", "42");
        Map<Object, Object> opts = new HashMap<Object, Object>();

        org.asciidoctor.ast.List list = createList(parent, context, attrs, opts);

        list.getBlocks().add(createListItem(list, "First item"));
        list.getBlocks().add(createListItem(list, "Second item"));

        return list;
    }
}
